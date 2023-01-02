import 'dart:async';
import 'dart:developer';

import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/core/widgets/bodymedium.dart';
import 'package:aden_envanterus/feature/checking/model/scanned_list.dart';
import 'package:aden_envanterus/models/customer_model.dart';
import 'package:aden_envanterus/models/items_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_scanner/src/flutter_code_scanner.dart';
import 'package:flutter_code_scanner/src/flutter_code_scanner_overlay_shape.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:collection/collection.dart';
import '../../../core/widgets/bodylarge.dart';
import '../../../core/widgets/headline6.dart';

class ScanQrCodeView extends StatefulWidget {
  final List<ItemsModel>? items;
  final double? quantity;
  final ItemsModel? item;
  final CustomerModel? customer;
  const ScanQrCodeView({
    Key? key,
    this.items,
    this.quantity,
    this.customer,
    this.item,
  }) : super(key: key);

  @override
  State<ScanQrCodeView> createState() => _ScanQrCodeViewState();
}

class _ScanQrCodeViewState extends State<ScanQrCodeView>
    with TickerProviderStateMixin {
  QrController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String name = '';
  late double quantity;
  double currentQuantity = 0;
  bool isChanged = false;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    resumeC();
    quantity = widget.quantity ?? 0;
    super.initState();
  }

  bool isList() {
    if (widget.items == null) {
      return false;
    } else {
      return true;
    }
  }

  void resumeC() async {
    await controller?.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();

    animationController.dispose();

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

    controller.scannedDataStream.listen((scanCode) async {
      if (isList()) {
        ItemsModel? item = widget.items!
            .where((element) =>
                element.QrKod == scanCode.code ||
                element.barkod == scanCode.code)
            .singleOrNull;
        if (item == null) {
          controller.pauseCamera();
          MotionToast.error(
              description: const Bodymedium(
            data: 'Kod Bulunamadı',
          )).show(context);
          await Future.delayed(const Duration(milliseconds: 500), () {
            controller.resumeCamera();
          });
        } else {
          if (getIt.get<ScannedListMobx>().scannedList.isEmpty) {
            controller.pauseCamera();
            getIt.get<ScannedListMobx>().addDoneList(
                name: item.adi!,
                itemId: item.oid!,
                customerId: widget.customer!.oid!,
                unit: item.birim!,
                item: item,
                quantity: 1);
            name = getIt.get<ScannedListMobx>().scannedList[0].name;
            currentQuantity =
                getIt.get<ScannedListMobx>().scannedList[0].quantity;
            setState(() {
              isChanged = true;
            });
            await Future.delayed(const Duration(milliseconds: 500), () {
              controller.resumeCamera();
            });
          } else if (getIt
              .get<ScannedListMobx>()
              .scannedList
              .any((element) => element.name == item.adi)) {
            controller.pauseCamera();
            getIt
                .get<ScannedListMobx>()
                .scannedList
                .where((element) => element.name == item.adi)
                .first
                .quantity = getIt
                    .get<ScannedListMobx>()
                    .scannedList
                    .where((element) => element.name == item.adi)
                    .first
                    .quantity +
                1;
            name = getIt
                .get<ScannedListMobx>()
                .scannedList
                .where((element) => element.name == item.adi)
                .first
                .name;
            currentQuantity = getIt
                .get<ScannedListMobx>()
                .scannedList
                .where((element) => element.name == item.adi)
                .first
                .quantity;
            setState(() {
              isChanged = true;
            });
            await Future.delayed(const Duration(milliseconds: 500), () {
              controller.resumeCamera();
            });
          } else {
            controller.pauseCamera();
            getIt.get<ScannedListMobx>().addDoneList(
                name: item.adi!,
                itemId: item.oid!,
                customerId: widget.customer!.oid!,
                unit: item.birim!,
                item: item,
                quantity: 1);
            name = getIt
                .get<ScannedListMobx>()
                .scannedList
                .where((element) => element.name == item.adi)
                .first
                .name;
            currentQuantity = getIt
                .get<ScannedListMobx>()
                .scannedList
                .where((element) => element.name == item.adi)
                .first
                .quantity;
            setState(() {
              isChanged = true;
            });
            await Future.delayed(const Duration(milliseconds: 500), () {
              controller.resumeCamera();
            });
          }
        }
      } else {
        if (widget.item?.QrKod == scanCode.code ||
            widget.item?.barkod == scanCode.code) {
          quantity++;
          setState(() {
            isChanged = true;
          });
        } else {
          controller.pauseCamera();
          MotionToast.error(
              description: const Bodymedium(
            data: 'Kod Bulunamadı',
            color: Colors.white,
          )).show(context);
          await Future.delayed(const Duration(milliseconds: 500), () {
            controller.resumeCamera();
          });
        }
      }
    });
  }

  Future<void> _onPermissionSet(
      BuildContext context, QrController ctrl, bool p) async {
    await ctrl.resumeCamera();
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');

    if (!p) {
      await PhotoManager.openSetting();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Tarama Yap'),
        leading: IconButton(
          onPressed: () {
            if (widget.quantity == null) {
              context.router.pop();
            } else {
              context.router.pop<double>(quantity);
            }
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: Bodylarge(
                  data: isList()
                      ? (isChanged
                          ? '$name : ${currentQuantity.toInt().toString()}'
                          : '')
                      : '+ ${quantity.toInt()}',
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
        ],
      ),
    );
  }
}

extension MyIterable<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;

  T? firstWhereOrNull(bool Function(T element) test) {
    final list = where(test);
    return list.isEmpty ? null : list.first;
  }
}
