import 'dart:async';
import 'dart:developer';

import 'package:aden_envanterus/core/util/extension.dart';
import 'package:aden_envanterus/core/widgets/bodylarge.dart';
import 'package:aden_envanterus/core/widgets/bodymedium.dart';
import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:aden_envanterus/feature/checking/model/check_qr_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:flutter_code_scanner/src/flutter_code_scanner.dart';
import 'package:flutter_code_scanner/src/flutter_code_scanner_overlay_shape.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:motion_toast/motion_toast.dart';

class ScanQrCodeView extends StatefulWidget {
  final CheckQrModel qrModel;
  const ScanQrCodeView({Key? key, required this.qrModel}) : super(key: key);

  @override
  State<ScanQrCodeView> createState() => _ScanQrCodeViewState();
}

class _ScanQrCodeViewState extends State<ScanQrCodeView>
    with TickerProviderStateMixin {
  QrController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late double count;
  late AnimationController animationController;

  @override
  void initState() {
    count = widget.qrModel.quantity;
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    resumeC();
    super.initState();
  }

  void resumeC() async {
    await controller?.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 180.0
        : 240.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.white,
        borderLength: 30,
        borderWidth: 5,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QrController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) async {
      if (scanData.code == widget.qrModel.item.barkod ||
          scanData.code == widget.qrModel.item.kod) {
        late Timer timer;
        await controller.pauseCamera();
        await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            timer = Timer(
              const Duration(milliseconds: 3000),
              () {
                Navigator.pop(context);
                animationController.reset();
              },
            );
            return Dialog(
              insetPadding: const EdgeInsets.all(32.0),
              child: SizedBox(
                height: context.dynamicHeight(.5),
                child: Column(
                  children: [
                    const Spacer(),
                    const Headline6(
                      data: 'İşlem Başarılı',
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 20),
                    Lottie.asset(
                      context.getPath(
                          folder: 'animations', file: 'success.json'),
                      width: 100,
                      height: 100,
                      controller: animationController,
                      repeat: false,
                      reverse: false,
                      onLoaded: (p0) {
                        animationController.forward();
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            );
          },
        ).then((value) {
          if (timer.isActive) {
            timer.cancel();
          }
        });
        setState(() {
          count++;
        });
        controller.resumeCamera();
      } else {
        await controller.pauseCamera();
        MotionToast.error(
            description: const Bodymedium(
          data: 'Kod Bulunamadı',
        )).show(context);
        await controller.resumeCamera();
      }
    });
  }

  Future<void> _onPermissionSet(
      BuildContext context, QrController ctrl, bool p) async {
    await ctrl.resumeCamera();
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');

    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Tarama Yap'),
        leading: IconButton(
          onPressed: () {
            context.router.pop<double>(widget.qrModel.quantity);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: Bodylarge(
                  data: '+$count',
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: _buildQrView(context)),
          SizedBox(
            height: 60,
            child: GFButton(
              onPressed: count == 0 || widget.qrModel.quantity == count
                  ? null
                  : () async {
                      await context.router.pop<double>(count);
                    },
              fullWidthButton: true,
              child: const Bodymedium(
                data: 'Kaydet',
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
