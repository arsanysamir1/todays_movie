import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class MoviePlayerController extends GetxController {
  final String videoUrl;
  final movieName;

  MoviePlayerController({required this.movieName, required this.videoUrl});

  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  var isInitialized = false.obs;

  @override
  void onInit() {
    super.onInit();

    initializePlayer();
  }

  Future<void> initializePlayer() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = File("${directory.path}/$movieName.mp4");

    if (await filePath.exists()) {
      print("Playing from local storage: ${filePath.path}");
      videoPlayerController = VideoPlayerController.file(filePath);
    } else {
      print("File not found locally. Playing from URL: $videoUrl");
      videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(videoUrl),
      );
    }
    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: false,
      fullScreenByDefault: true,
      // Lock to landscape
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.purple,
        handleColor: Colors.purpleAccent,
      ),
    );

    isInitialized.value = true;

    // Listen to video position to check against daily time limit
    videoPlayerController.addListener(() {});
  }

  @override
  void onClose() {
    // Reset orientation back to portrait when leaving
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.onClose();
  }
}
