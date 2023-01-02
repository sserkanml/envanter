import 'dart:io';
import 'package:aden_envanterus/core/constant/cameras_constant.dart';
import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/core/widgets/bodymedium.dart';
import 'package:aden_envanterus/core/widgets/bodysmall.dart';
import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:aden_envanterus/feature/checking/model/take_picture_mobx.dart';
import 'package:aden_envanterus/models/customer_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TakePictureForChecksView extends StatefulWidget {
  final CustomerModel customer;
  const TakePictureForChecksView({
    Key? key,
    required this.customer,
  }) : super(key: key);

  @override
  State<TakePictureForChecksView> createState() =>
      _TakePictureForChecksViewState();
}

class _TakePictureForChecksViewState extends State<TakePictureForChecksView>
    with WidgetsBindingObserver {
  late CameraController _Cameracontroller;

  void showInSnackBar(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Bodymedium(
      data: error,
    )));
  }

  Future<void> initializeController(CameraController controller) async {
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    try {
      await controller.initialize();
    } on CameraException catch (exception) {
      switch (exception.code) {
        case 'CameraAccessDenied':
          showInSnackBar('Kamera Erişimi Reddedildi');
          openAppSettings();
          break;
        case 'CameraAccessDeniedWithoutPrompt':
          // iOS only
          showInSnackBar(
              'Uygulama Ayarlarına Giderek Kamera Ayarlarına İzin Verin');
          break;
        case 'CameraAccessRestricted':
          // iOS only
          showInSnackBar('Kamera Erişimi Kısıtlandı');
          break;
        case 'AudioAccessDenied':
          showInSnackBar('Ses Erişimi Reddedildi');
          break;
        case 'AudioAccessDeniedWithoutPrompt':
          // iOS only
          showInSnackBar(
              'Uygulama Ayarlarına Giderek Ses Ayarlarına İzin Verin ');
          break;
        case 'AudioAccessRestricted':
          // iOS only
          showInSnackBar('Ses Erişimi Kısıtlandı');
          break;
      }
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _Cameracontroller =
        CameraController(cameras[0], ResolutionPreset.high, enableAudio: false);

    super.initState();
  }

  @override
  void didChangeDependencies() async {
    _Cameracontroller.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (_Cameracontroller.value.hasError) {
        showInSnackBar(""
            'Camera error ${_Cameracontroller.value.errorDescription}');
      }
    });
    await initializeController(_Cameracontroller);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _Cameracontroller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.inactive) {
      _Cameracontroller.dispose();
    } else {
      _Cameracontroller = CameraController(cameras[0], ResolutionPreset.high);
      await initializeController(_Cameracontroller);
      super.didChangeAppLifecycleState(state);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Müşteri Fotoğraf'),
        leading: IconButton(
          onPressed: () {
            context.router.pop<bool>(false);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(child: CameraPreview(_Cameracontroller)),
            Positioned(
              bottom: 30,
              child: SizedBox(
                height: 70,
                width: 70,
                child: FloatingActionButton(
                  heroTag: 'takePicture',
                  onPressed: () async {
                    try {
                      final XFile file = await _Cameracontroller.takePicture();
                      getIt.get<TakePicture>().addPhoto(file);

                      if (getIt.get<TakePicture>().is3TakenPhoto) {
                        context.router.pop<bool>(true);
                      }
                    } on CameraException catch (e) {
                      print(e.code);
                    }
                  },
                  child: const Icon(
                    FontAwesomeIcons.camera,
                    size: 35,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 10,
              child: getIt.get<TakePicture>().takePicture.isEmpty
                  ? const SizedBox()
                  : Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.file(
                            File(getIt
                                .get<TakePicture>()
                                .takePicture
                                .first
                                .path),
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                          ),
                        )),
                        Positioned(
                            top: -10,
                            right: 0,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                              child: Center(
                                child: Observer(builder: (_) {
                                  return Bodysmall(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      data: getIt
                                          .get<TakePicture>()
                                          .getListLength
                                          .toString());
                                }),
                              ),
                            ))
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
