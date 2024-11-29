import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:main_ford/controller/functionsprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/view/authentication/widgets/custombutton.dart';
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
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    super.initState();
    getConnectivity();
    final functionsProvider =
        Provider.of<FunctionsProvider>(context, listen: false);
    functionsProvider.getUser().then(
      (value) {
        functionsProvider.youtube(functionsProvider.userModel!.courses);
      },
    );
    functionsProvider.getPayementData();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  showDialogBox() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: AppColors.bgColor,
          title: const Text('No Connection'),
          content: const Text('Please check your Internet Connection'),
          actions: [
            CustomElButton(
              text: 'Okay',
              onPressed: () async {
                Navigator.pop(context);
                setState(() {
                  isAlertSet = false;
                });
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected) {
                  showDialogBox();
                  setState(() {
                    isAlertSet = true;
                  });
                }
              },
            ),
          ],
        ),
      );

  getConnectivity() async {
    print('object');
    return subscription =
        Connectivity().onConnectivityChanged.listen((result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected && isAlertSet == false) {
        showDialogBox();
        setState(() {
          isAlertSet = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final functionsProvider = Provider.of<FunctionsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          functionsProvider.userPayementModel != null
              ? Text(functionsProvider.userPayementModel!.balance.toString())
              : const Text('_ _'),
          const IconButton(
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
                  'Online Courses',
                  style: MyTextStyles.subHeadText,
                ),
              ),
              Consumer<FunctionsProvider>(
                  builder: (context, functionsProvider, child) {
                if (functionsProvider.playListModel1 != null) {
                  return SizedBox(
                    height: size.height * 0.23,
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
                                  videoId: functionsProvider.playListModel1!
                                      .items![index].contentDetails!.videoId!,
                                  nextvideoId: functionsProvider
                                      .playListModel1!
                                      .items![index + 1]
                                      .contentDetails!
                                      .videoId!,
                                  text: functionsProvider.playListModel1!
                                      .items![index].snippet!.title!,
                                  desc: functionsProvider.playListModel1!
                                      .items![index].snippet!.description!,
                                  date: functionsProvider.playListModel1!
                                      .items![index].snippet!.publishedAt!,
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: size.width * 0.4,
                            child: Column(
                              children: [
                                Container(
                                  height: size.height * 0.15,
                                  decoration: BoxDecoration(
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
                                Text(
                                  functionsProvider.playListModel1!
                                      .items![index].snippet!.title!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return ShimmerVideosWidget(size: size);
              }),
              // Constants.height10,
              // const Padding(
              //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              //   child: Text(
              //     'Digital Marketing',
              //     style: MyTextStyles.subHeadText,
              //   ),
              // ),
              Consumer<FunctionsProvider>(
                  builder: (context, functionsProvider, child) {
                if (functionsProvider.playListModel2 != null) {
                  return SizedBox(
                    height: size.height * 0.23,
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
                          child: SizedBox(
                            width: size.width * 0.4,
                            child: Column(
                              children: [
                                Container(
                                  height: size.height * 0.15,
                                  // width: size.width * 0.4,
                                  decoration: BoxDecoration(
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
                                Text(
                                  functionsProvider.playListModel2!
                                      .items![index].snippet!.title!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return ShimmerVideosWidget(size: size);
              }),
              // Constants.height10,
              // const Padding(
              //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              //   child: Text(
              //     'MS Excel',
              //     style: MyTextStyles.subHeadText,
              //   ),
              // ),
              Consumer<FunctionsProvider>(
                builder: (context, functionsProvider, child) {
                  if (functionsProvider.playListModel3 != null) {
                    return SizedBox(
                      height: size.height * 0.25,
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
                                    videoId: functionsProvider.playListModel3!
                                        .items![index].contentDetails!.videoId!,
                                    nextvideoId: functionsProvider
                                        .playListModel3!
                                        .items![index + 1]
                                        .contentDetails!
                                        .videoId!,
                                    text: functionsProvider.playListModel3!
                                        .items![index].snippet!.title!,
                                    desc: functionsProvider.playListModel3!
                                        .items![index].snippet!.description!,
                                    date: functionsProvider.playListModel3!
                                        .items![index].snippet!.publishedAt!,
                                  ),
                                ),
                              );
                            },
                            child: SizedBox(
                              width: size.width * 0.4,
                              child: Column(
                                children: [
                                  Container(
                                    height: size.height * 0.15,
                                    // width: size.width * 0.4,
                                    decoration: BoxDecoration(
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
                                  Text(
                                    functionsProvider.playListModel3!
                                        .items![index].snippet!.title!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return ShimmerVideosWidget(size: size);
                },
              ),
              // Constants.height15,
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
