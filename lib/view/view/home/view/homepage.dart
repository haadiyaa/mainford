import 'package:flutter/material.dart';
import 'package:main_ford/controller/functionsprovider.dart';
import 'package:main_ford/model/playlistmodel.dart';
import 'package:main_ford/model/usermodel.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/view/home/view/videospage.dart';
import 'package:main_ford/view/view/home/widgets/customcurousel.dart';
import 'package:main_ford/view/view/home/widgets/mydrawer.dart';
import 'package:main_ford/view/view/home/widgets/shimmervidoes.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late UserModel user;
  // PlayListModel? playListModel;
  @override
  void initState() {
    super.initState();
    final functionsProvider =
        Provider.of<FunctionsProvider>(context, listen: false);
    functionsProvider.getUser().then(
      (value) {
        functionsProvider.youtube(functionsProvider.userModel!.courses);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [
          Text('100'),
          IconButton(
            icon: Icon(
              Icons.monetization_on,
              color: AppColors.yellow,
            ),
            onPressed: null,
          ),
          Constants.width5,
        ],
      ),
      drawer: const MyDrawer(),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.3,
                width: size.width,
                child: const CustomCurousel(),
              ),
              Constants.height10,
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  'DSA Series',
                  style: MyTextStyles.subHeadText,
                ),
              ),
              Consumer<FunctionsProvider>(
                  builder: (context, functionsProvider, child) {
                if (functionsProvider.playListModel1 != null) {
                  return SizedBox(
                    height: size.height * 0.15,
                    width: size.width,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          functionsProvider.playListModel1!.items!.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Constants.width10;
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => VideosPage(
                                          videoId: functionsProvider
                                              .playListModel1!
                                              .items![index]
                                              .contentDetails!
                                              .videoId!,
                                          nextvideoId: functionsProvider
                                              .playListModel1!
                                              .items![index + 1]
                                              .contentDetails!
                                              .videoId!,
                                          text: functionsProvider
                                              .playListModel1!
                                              .items![index]
                                              .snippet!
                                              .title!,
                                          desc: functionsProvider
                                              .playListModel1!
                                              .items![index]
                                              .snippet!
                                              .description!,
                                          date: functionsProvider
                                              .playListModel1!
                                              .items![index]
                                              .snippet!
                                              .publishedAt!,
                                        )));
                          },
                          child: Container(
                            height: size.height * 0.15,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  YoutubePlayer.getThumbnail(
                                      videoId: functionsProvider
                                          .playListModel1!
                                          .items![index]
                                          .contentDetails!
                                          .videoId!),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return ShimmerVideosWidget(size: size);
              }),
              Constants.height10,
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  'Digital Marketing',
                  style: MyTextStyles.subHeadText,
                ),
              ),
              Consumer<FunctionsProvider>(
                  builder: (context, functionsProvider, child) {
                if (functionsProvider.playListModel2 != null) {
                  return SizedBox(
                    height: size.height * 0.15,
                    width: size.width,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          functionsProvider.playListModel2!.items!.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Constants.width10;
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => VideosPage(
                                          videoId: functionsProvider
                                              .playListModel2!
                                              .items![index]
                                              .contentDetails!
                                              .videoId!,
                                          nextvideoId: functionsProvider
                                              .playListModel2!
                                              .items![index + 1]
                                              .contentDetails!
                                              .videoId!,
                                          text: functionsProvider
                                              .playListModel2!
                                              .items![index]
                                              .snippet!
                                              .title!,
                                          desc: functionsProvider
                                              .playListModel2!
                                              .items![index]
                                              .snippet!
                                              .description!,
                                          date: functionsProvider
                                              .playListModel2!
                                              .items![index]
                                              .snippet!
                                              .publishedAt!,
                                        )));
                          },
                          child: Container(
                            height: size.height * 0.15,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  YoutubePlayer.getThumbnail(
                                      videoId: functionsProvider
                                          .playListModel2!
                                          .items![index]
                                          .contentDetails!
                                          .videoId!),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return ShimmerVideosWidget(size: size);
              }),
              Constants.height10,
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  'MS Excel',
                  style: MyTextStyles.subHeadText,
                ),
              ),
              Consumer<FunctionsProvider>(
                  builder: (context, functionsProvider, child) {
                if (functionsProvider.playListModel3 != null) {
                  return SizedBox(
                    height: size.height * 0.15,
                    width: size.width,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          functionsProvider.playListModel3!.items!.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Constants.width10;
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => VideosPage(
                                          videoId: functionsProvider
                                              .playListModel3!
                                              .items![index]
                                              .contentDetails!
                                              .videoId!,
                                          nextvideoId: functionsProvider
                                              .playListModel3!
                                              .items![index + 1]
                                              .contentDetails!
                                              .videoId!,
                                          text: functionsProvider
                                              .playListModel3!
                                              .items![index]
                                              .snippet!
                                              .title!,
                                          desc: functionsProvider
                                              .playListModel3!
                                              .items![index]
                                              .snippet!
                                              .description!,
                                          date: functionsProvider
                                              .playListModel3!
                                              .items![index]
                                              .snippet!
                                              .publishedAt!,
                                        )));
                          },
                          child: Container(
                            height: size.height * 0.15,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  YoutubePlayer.getThumbnail(
                                      videoId: functionsProvider
                                          .playListModel3!
                                          .items![index]
                                          .contentDetails!
                                          .videoId!),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return ShimmerVideosWidget(size: size);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> refresh() async {
    final functionsProvider =
        Provider.of<FunctionsProvider>(context, listen: false);
    await functionsProvider.getUser();
  }
}
