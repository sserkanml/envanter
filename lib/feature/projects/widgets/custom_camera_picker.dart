import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class CustomCameraPickerDelegate extends CameraPickerTextDelegate {
  @override
  // TODO: implement confirm
  String get confirm => 'Onayla';
  @override
  // TODO: implement shootingTips
  String get shootingTips => 'Fotoğraf Çek';
}
