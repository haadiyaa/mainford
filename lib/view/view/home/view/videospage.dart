import 'package:flutter/material.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:screen_protector/screen_protector.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosPage extends StatefulWidget {
  const VideosPage(
      {super.key,
      required this.videoId,
      this.nextvideoId,
      required this.text,
      required this.desc,
      this.date});
  final String videoId;
  final String? nextvideoId;
  final String text;
  final String desc;
  final String? date;

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  late YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: widget.videoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
    ),
  );

  @override
  void initState() {
    super.initState();
    avoidScreenShot();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.videoId);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: _controller,
              onEnded: (metaData) {
                if (widget.nextvideoId != null) {
                  _controller.load(widget.nextvideoId!);
                  _controller.play();
                } else {
                  _controller.pause();
                }
              },
              bottomActions: const [
                CurrentPosition(),
                ProgressBar(
                  isExpanded: true,
                ),
                RemainingDuration(),
                PlaybackSpeedButton(),
              ],
            ),
            Constants.height10,
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.text,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: widget.date == null
                  ? null
                  : Text(
                      'Published at : ${widget.date}',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 170, 170, 170)),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.desc,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    accessScreenShot();
    _controller.dispose();
    super.dispose();
  }

  accessScreenShot() async {
    await ScreenProtector.protectDataLeakageOff();
  }

  avoidScreenShot() async {
    await ScreenProtector.protectDataLeakageOn();
  }
}
