import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chewie/chewie.dart';
import '../controllers/MoviePlayerScreen.dart';

class MoviePlayerScreen extends StatelessWidget {
  final String videoUrl;
  final String movieName;

  const MoviePlayerScreen({
    super.key,
    required this.movieName,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize the controller specifically for this video
    final controller =  Get.put(MoviePlayerController(videoUrl: videoUrl, movieName: movieName));
    print("movie name"+movieName);
    return Scaffold(
      backgroundColor: Colors.purple.shade900,
      body: Obx(() {
        return controller.isInitialized.value
            ? Chewie(controller: controller.chewieController!)
            : const Center(
                child: CircularProgressIndicator(color: Colors.purple),
              );
      }),
    );
  }
}
