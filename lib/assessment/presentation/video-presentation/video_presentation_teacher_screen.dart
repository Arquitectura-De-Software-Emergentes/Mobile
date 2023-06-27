import 'package:flutter/material.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';

import '../../../common/styles/styles.dart';
import '../../infrastructure/services/camera_gallery_service_impl.dart';

class VideoPresentationTeacherScreen extends StatefulWidget {
  const VideoPresentationTeacherScreen({super.key});

  @override
  State<VideoPresentationTeacherScreen> createState() =>
      _VideoPresentationTeacherScreenState();
}

class _VideoPresentationTeacherScreenState
    extends State<VideoPresentationTeacherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Video',
      ),
      body: Center(
          child: Container(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.add_circle_rounded, size: 200),
          const SizedBox(
            height: 20,
          ),
          Container(
            constraints: const BoxConstraints.tightFor(width: 220, height: 40),
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
                  if (videoPath == null) return;

                  videoPath;
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
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            constraints: const BoxConstraints.tightFor(width: 220, height: 40),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Styles.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () async {
                  final videoPath =
                      await CameraGalleryServiceImpl().takeVideo();
                  if (videoPath == null) return;

                  videoPath;
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
                        'Take Video',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ))),
    );
  }
}
