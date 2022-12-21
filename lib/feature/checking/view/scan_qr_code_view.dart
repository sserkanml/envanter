import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../core/widgets/bodylarge.dart';
import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/headline6.dart';
import '../../../models/items_model.dart';
import 'appbar_qr_code.dart';

class ScanQrCodeView extends StatefulWidget {
  final int counter;
  final ItemsModel item;
  const ScanQrCodeView({
    Key? key,
    required this.counter,
    required this.item,
  }) : super(key: key);

  @override
  State<ScanQrCodeView> createState() => _ScanQrCodeViewState();
}

class _ScanQrCodeViewState extends State<ScanQrCodeView> {
  late int counter;

  @override
  void initState() {
    counter = widget.counter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Tarama Yap'),
        leading: IconButton(
          onPressed: () {
            context.router.pop<int>(counter);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [Bodylarge(data: '+$counter')],
      ),
      body: Column(
        children: [
          Expanded(
            child: AppBarcodeScannerWidget.defaultStyle(
              resultCallback: (String code) {
                if (code == widget.item.kod || code == widget.item.barkod) {
                  counter++;
                  setState(() {});
                } else {
                  MotionToast.error(
                      description: const Bodymedium(
                    data: 'Okunan Kod Hatalı !',
                  ));
                }
              },
              openManual: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GFButton(
              fullWidthButton: true,
              onPressed: () {},
              child: const Bodylarge(
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
