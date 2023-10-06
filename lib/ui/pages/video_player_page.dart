import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:rosseti_second/constants/constants.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final String videoPath;
  const VideoPage({
    super.key,
    required this.videoPath,
  });

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    _videoController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoPath))
          ..initialize().then((_) {
            setState(() {});
          });

    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      aspectRatio: 16 / 9,
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _chewieController.dispose();
    _videoController.dispose();
    super.dispose();
  }

  double curentVal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
            margin: EdgeInsets.all(16),
            height: Globals().size.height / 3,
            child: Stack(
              children: [
                GestureDetector(
                    onTap: () {}, child: Chewie(controller: _chewieController)),
              ],
            )),
      ),
    );
  }
}
