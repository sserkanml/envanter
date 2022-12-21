import 'package:aden_envanterus/core/util/extension.dart';
import 'package:aden_envanterus/core/widgets/bodylarge.dart';
import 'package:aden_envanterus/models/customer_model.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/widgets/headline6.dart';

class CreateChecksView extends StatefulWidget {
  final CustomerModel customer;
  const CreateChecksView({Key? key, required this.customer}) : super(key: key);

  @override
  State<CreateChecksView> createState() => _CreateChecksViewState();
}

class _CreateChecksViewState extends State<CreateChecksView> {
  @override
  void initState() {
    print(widget.customer);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
         await BarcodeScanner.scan(options: ScanOptions(
          strings: {
            'cancel':'İptal Et'
          }
         ));
         
        },
        child: SvgPicture.asset(
          context.getPath(folder: 'svg', file: 'qr_code.svg'),
          color: Colors.white,
          width: 30,
          height: 30,
        ),
      ),
      appBar: AppBar(
        title: const Headline6(data: 'Sayım Oluştur'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const <Widget>[Bodylarge(data: 'Sayım Başlat')],
        ),
      )),
    );
  }
}
