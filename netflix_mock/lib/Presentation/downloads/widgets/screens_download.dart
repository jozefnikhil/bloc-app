import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_mock/Core/colors.dart';
import 'package:netflix_mock/Core/constant.dart';
import 'package:netflix_mock/Presentation/widgets/app_bar_widget.dart';
import 'package:netflix_mock/application/downloads/downloads_bloc.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({super.key});

  final _widgetList = [
    const _SmartDownloadScreen(),
    const Section2(),
    const Section3()
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'DownloadScreen',
          )),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => _widgetList[index],
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: _widgetList.length,
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) {
    BlocProvider.of<DownloadsBloc>(context)
        .add(const DownloadsEvent.getDownloadsImage());
    //   },
    // );
    return Column(
      children: [
        const Text(
          'Introducing DownloadScreen For You',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Text(
          "We will download a personalised Selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        kheight,
        BlocBuilder<DownloadsBloc, DownloadsState>(builder: (context, state) {
          if (state.downloads != null && state.downloads!.length >= 3) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: state.isloading
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white))
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.37,
                          backgroundColor: Colors.grey.withOpacity(.5),
                        ),
                        DownloadScreenimgs(
                          size: Size(MediaQuery.of(context).size.width * 0.35,
                              MediaQuery.of(context).size.width * 0.55),
                          imageList: '${state.downloads![0].posterPath}',
                          angle: -5.8,
                          margin: const EdgeInsets.only(left: 75, top: 5),
                        ),
                        DownloadScreenimgs(
                          size: Size(MediaQuery.of(context).size.width * 0.35,
                              MediaQuery.of(context).size.width * 0.55),
                          imageList: '${state.downloads![1].posterPath}',
                          angle: 5.8,
                          margin: const EdgeInsets.only(
                            top: 5,
                            right: 75,
                          ),
                        ),
                        DownloadScreenimgs(
                          size: Size(MediaQuery.of(context).size.width * 0.4,
                              MediaQuery.of(context).size.width * 0.6),
                          imageList: '${state.downloads![2].posterPath}',
                          angle: 0,
                          margin: const EdgeInsets.only(bottom: 10, top: 20),
                          radius: 5,
                        )
                      ],
                    ),
            );
          }
          return const CircularProgressIndicator();
        }),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.blue[700],
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(color: kWhite, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.white,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloadScreen extends StatelessWidget {
  const _SmartDownloadScreen();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: kWhite,
        ),
        Text('Smart DownloadScreen')
      ],
    );
  }
}

class DownloadScreenimgs extends StatelessWidget {
  const DownloadScreenimgs({
    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  });
  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              image: DecorationImage(
                  fit: BoxFit.fill, image: NetworkImage(imageList))),
        ),
      ),
    );
  }
}
