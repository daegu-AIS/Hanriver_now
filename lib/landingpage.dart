import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanriver_now/mainpages/mylikescreen.dart';
import 'package:video_player/video_player.dart';

class LandingPage extends StatefulWidget {
  int time = 2;

  LandingPage(this.time);
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    Timer(Duration(seconds: widget.time), () {
      Get.offAll(MyLikeScreen());
    });
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/landing.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    _controller.play();
    return Container(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(),
    );
  }
}
