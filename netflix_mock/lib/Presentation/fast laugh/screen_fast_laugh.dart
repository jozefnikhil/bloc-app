import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_mock/Presentation/fast%20laugh/widgets/video_list_item.dart';
import 'package:netflix_mock/application/fast_laugh/fast_laugh_bloc.dart';

class FastLaugh extends StatelessWidget {
  const FastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(child: BlocBuilder<FastLaughBloc, FastLaughState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.isError) {
            return const Center(
              child: Text('Error While getting data'),
            );
          } else if (state.videoList.isEmpty) {
            return const Center(
              child: Text('Videolist is Empty'),
            );
          } else {
            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(
                  state.videoList.length,
                  (index) => VideoListItemInheritedWidget(
                        widget: VideoListItem(
                            key: Key(index.toString()), index: index),
                        movieData: state.videoList[index],
                      )),
            );
          }
        },
      )),
    );
  }
}
