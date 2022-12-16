import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class AssetEntityModel {
  final AssetEntity entity;
  bool isSelecting = false;

  AssetEntityModel(this.entity);
}

class CameraManagmentService {
  static List<AssetEntity> assetsEntities = [];
  static List<AssetEntityModel> selectedEntities = [];
  static List<AssetEntityModel> selectedEntitiesCopy = [];
  static int newPage = 0;
  static int lastPage = 0;

  static void handleScrollEvent(
      ScrollNotification scroll, VoidCallback callback) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.70) {
      if (newPage != lastPage) {
        getPermission(callback: callback);
      } else {}
    } else {}
  }

  static Future<void> getPermission({VoidCallback? callback}) async {
    lastPage = newPage;
    final PermissionState ps = await PhotoManager.requestPermissionExtend();

    if (ps.isAuth) {
      final path = await PhotoManager.getAssetPathList(
        type: RequestType.image,
      );
      final result = await path[0].getAssetListPaged(page: newPage, size: 30);

      if (callback == null) {
      } else {
        assetsEntities.addAll(result);
        selectedEntitiesCopy.addAll(result.map<AssetEntityModel>((e) {
          return AssetEntityModel(e);
        }).toList());
        newPage++;
        callback();
      }
    } else {
      await PhotoManager.openSetting();
    }
  }
}
