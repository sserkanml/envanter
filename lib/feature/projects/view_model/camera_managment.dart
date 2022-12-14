import 'package:photo_manager/photo_manager.dart';

class CameraManagmentService {
  List<AssetEntity> assetsEntities = [];

  void getPermission() async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();

    if (ps.isAuth) {
      final path = await PhotoManager.getAssetPathList(
        type: RequestType.image,
      );
      assetsEntities = await path[0].getAssetListPaged(page: 0, size: 30);
    } else {
      await PhotoManager.openSetting();
    }
  }
}
