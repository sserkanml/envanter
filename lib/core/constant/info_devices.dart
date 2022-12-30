import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';

class InfoDevices {
  DeviceInfoPlugin infoDevice = DeviceInfoPlugin();

  Future<void> getInfo() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await infoDevice.androidInfo;

   
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await infoDevice.iosInfo;
      
    } else {}
  }
}
