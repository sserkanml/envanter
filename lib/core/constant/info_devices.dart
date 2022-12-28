import 'package:device_info_plus/device_info_plus.dart';



class InfoDevices {

DeviceInfoPlugin infoDevice=DeviceInfoPlugin();

late AndroidDeviceInfo  androidInfo;
late IosDeviceInfo iosInfo;

 Future<void> getAllInfo()async{
  androidInfo=await infoDevice.androidInfo;
  iosInfo=await infoDevice.iosInfo;
  print(androidInfo.version);
    print(iosInfo.systemVersion);
 } 

}
