import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_mock/Core/colors.dart';
import 'package:netflix_mock/Core/constant.dart';
import 'package:netflix_mock/Presentation/new%20and%20hot/widgets/coming_soon.dart';
import 'package:netflix_mock/application/hot_and_new/hot_and_new_bloc.dart';

class NewAndHot extends StatelessWidget {
  const NewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const Text(
                'New & Hot',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: kWhite,
                ),
                kWidth,
                Container(
                  width: 30,
                  height: 30,
                  color: Colors.blue,
                ),
                kWidth
              ],
              bottom: TabBar(
                  isScrollable: true,
                  labelColor: Colors.black,
                  dividerColor: Colors.black,
                  unselectedLabelColor: kWhite,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator:
                      BoxDecoration(color: kWhite, borderRadius: kRadius30),
                  tabs: const [
                    Tab(
                      text: '🍿Coming Soon',
                    ),
                    Tab(
                      text: "👀Everyone's Watching",
                    ),
                  ]),
            )),
        body: TabBarView(children: [
          const ComingSoonList(
            key: Key('coming_soon'),
          ),
          _buildEveryonesWatching()
        ]),
      ),
    );
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) => const SizedBox());
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDatainComingSoon());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.hasError) {
          return const Center(child: Text('Error while Loading the list'));
        } else if (state.hotAndnewdata.isEmpty) {
          return const Center(child: Text('ComingSoonList is Empty'));
        } else {
          return ListView.builder(itemBuilder: (BuildContext context, index) {
            final movie = state.hotAndnewdata[index];

            if (movie.id == null) {
              const SizedBox();
            }
            final date = DateTime.parse(movie.releaseDate!);
            final formattedDate = DateFormat.yMMMMd('en_US').format(date);
            return ComingSoonWidget(
                id: movie.id.toString(),
                month: formattedDate
                    .split(' ')
                    .first
                    .substring(0, 3)
                    .toUpperCase(),
                day: movie.releaseDate!.split('-')[1],
                posterPath: movie.posterPath ?? '',
                movieName: movie.originalTitle ?? '',
                description: movie.overview ?? '');
          });
        }
      },
    );
  }
}
