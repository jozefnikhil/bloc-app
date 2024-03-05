import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_mock/Core/colors.dart';
import 'package:netflix_mock/Presentation/main%20page/widgets/screen_main.dart';
import 'package:netflix_mock/application/Search/search_bloc.dart';
import 'package:netflix_mock/application/downloads/downloads_bloc.dart';
import 'package:netflix_mock/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_mock/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_mock/domain/core/di/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<DownloadsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<SearchBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<FastLaughBloc>(),
        ),
       BlocProvider(
        create: (context) => getIt<HotAndNewBloc>(),)
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              titleTextStyle: TextStyle(color: kWhite)),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: Typography.whiteCupertino,
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
              .copyWith(background: Colors.black),
        ),
        home: MainPage(),
      ),
    );
  }
}
