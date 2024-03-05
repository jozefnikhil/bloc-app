import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_mock/Core/colors.dart';
import 'package:netflix_mock/Core/constant.dart';
import 'package:netflix_mock/Presentation/search/widgets/search_idle.dart';
import 'package:netflix_mock/Presentation/search/widgets/search_result.dart';
import 'package:netflix_mock/application/Search/search_bloc.dart';
import 'package:netflix_mock/domain/core/debounce/debounce.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  final _debouncer = Debouncer(milliseconds: 1 * 1000);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              backgroundColor: Colors.grey.withOpacity(0.4),
              style: const TextStyle(color: kWhite),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              onChanged: (value) {
                _debouncer.run(() {
                  if (value.isEmpty) {
                    return;
                  }
                  BlocProvider.of<SearchBloc>(context)
                      .add(SearchMovie(movieQuery: value));
                });
              },
            ),
            Expanded(child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.searchResultList.isEmpty) {
                  return const SearchIdle();
                } else {
                  return const SearchResult();
                }
              },
            )),
            kheight,
            // const Expanded(child: SearchResult())
          ],
        ),
      )),
    );
  }
}
