import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FullScreenVideoPage extends StatefulWidget {
  const FullScreenVideoPage({Key? key, required this.videoId}) : super(key: key);
  final String videoId;

  @override
  _FullScreenVideoPageState createState() => _FullScreenVideoPageState();
}

class _FullScreenVideoPageState extends State<FullScreenVideoPage> {
  late final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: widget.videoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
    ),
  );

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky); // Hide status bar and buttons
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onEnded: (metaData) {
          _controller.pause();
        },
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge); // Restore UI
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]); // Restore orientation
    _controller.dispose();
    super.dispose();
  }
}
