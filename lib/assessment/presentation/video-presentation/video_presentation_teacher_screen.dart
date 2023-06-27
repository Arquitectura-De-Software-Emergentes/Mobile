import 'dart:io';

import 'package:flutter/material.dart';
import 'package:teacher_finder/assessment/infrastructure/services/video_presentation_service.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';
import 'package:video_player/video_player.dart';

import '../../../common/styles/styles.dart';
import '../../infrastructure/services/camera_gallery_service_impl.dart';

class VideoPresentationTeacherScreen extends StatefulWidget {
  const VideoPresentationTeacherScreen({Key? key}) : super(key: key);

  @override
  State<VideoPresentationTeacherScreen> createState() =>
      _VideoPresentationTeacherScreenState();
}

class _VideoPresentationTeacherScreenState
    extends State<VideoPresentationTeacherScreen> {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;
  bool _hasVideoSelected = false;
  File? selectedVideoFile;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _playSelectedVideo(String? videoPath) {
    if (videoPath != null) {
      selectedVideoFile = File(videoPath);
      _controller = VideoPlayerController.file(File(videoPath));
      _initializeVideoPlayerFuture = _controller!.initialize();
      _controller!.play();
      setState(() {
        _hasVideoSelected = true;
      });
    } else {
      setState(() {
        selectedVideoFile = null;
        _hasVideoSelected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final successSnackBar = SnackBar(
      backgroundColor: Styles.error,
      content: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 15,
          ),
          Text('No video selected'),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video'),
        actions: [
          TextButton(
              onPressed: () async {
                final VideoPresentationService videoPresentationService =
                    VideoPresentationService();
                if (selectedVideoFile != null) {
                  //videoPresentationService.extractText(selectedVideoFile!);
                  print(await videoPresentationService
                      .extractText(selectedVideoFile!));
                } else {
                  // Manejar la situación cuando no hay un video seleccionado
                  ScaffoldMessenger.of(context)
                      .showSnackBar(successSnackBar)
                      .closed
                      .then((SnackBarClosedReason reason) {
                    if (reason != SnackBarClosedReason.action) {}
                  });
                }
              },
              child: Text(
                'SEND',
                style: TextStyle(
                    color: Styles.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_hasVideoSelected)
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              )
            else
              const Icon(
                Icons.image,
                size: 150,
                color: Colors.grey,
              ),
            const SizedBox(height: 20),
            FilledButton(
                onPressed: () {
                  setState(() {
                    if (_controller!.value.isPlaying) {
                      _controller!.pause();
                    } else {
                      _controller!.play();
                    }
                  });
                },
                child: Icon(
                  _controller != null && _controller!.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                )),
            Container(
              constraints:
                  const BoxConstraints.tightFor(width: 220, height: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Styles.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () async {
                  final videoPath =
                      await CameraGalleryServiceImpl().selectVideo();
                  _playSelectedVideo(videoPath);
                },
                child: const Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud_upload,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Select Video',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
