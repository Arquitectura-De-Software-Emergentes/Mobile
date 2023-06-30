import 'package:image_picker/image_picker.dart';

import 'camera_gallery_service.dart';

class CameraGalleryServiceImpl extends CameraGalleryService {
  final ImagePicker _picker = ImagePicker();
  @override
  Future<String?> selectVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);

    if (video == null) return null;

    return video.path;
  }

  @override
  Future<String?> takeVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.camera);

    if (video == null) return null;

    return video.path;
  }
}
