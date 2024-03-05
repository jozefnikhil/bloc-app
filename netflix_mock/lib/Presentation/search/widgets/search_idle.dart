import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_mock/Core/colors.dart';
import 'package:netflix_mock/Core/constant.dart';
import 'package:netflix_mock/Presentation/search/widgets/search_title.dart';
import 'package:netflix_mock/application/Search/search_bloc.dart';

const imageUrl =
    "https://movies.universalpictures.com/media/06-opp-dm-mobile-banner-1080x745-now-pl-f01-071223-64bab982784c7-1.jpg";

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      kheight,
      const SearchTextTitle(
        title: 'Top Searches',
      ),
      kheight,
      Expanded(
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else if (state.isError) {
              return const Center(
                child: Text('Error While Getting Data'),
              );
            } else if (state.idleList.isEmpty) {
              return const Center(
                child: Text('List is Empty'),
              );
            }
            return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final movie = state.idleList[index];
                  return TopSearchItemTile(
                      imageurl: movie.posterPath ?? '',
                      title: movie.originalTitle ?? '');
                },
                separatorBuilder: (context, index) => kheight1,
                itemCount: state.idleList.length);
          },
        ),
      )
    ]);
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageurl;
  const TopSearchItemTile(
      {super.key, required this.imageurl, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 65,
          width: screenWidth * 0.35,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageurl), fit: BoxFit.fitWidth)),
        ),
        const SizedBox(
          width: 6,
        ),
        Expanded(
            child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const Icon(
          CupertinoIcons.play_circle,
          color: kWhite,
          size: 25,
        )
      ],
    );
  }
}
