import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/route/router_generator.dart';
import '../../../core/service/dependecy_service.dart';
import '../../../core/util/extension.dart';
import '../../../core/widgets/bodylarge.dart';
import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/headline6.dart';
import '../../../models/customer_model.dart';
import '../../../models/items_service.dart';
import '../model/check_qr_model.dart';

class CreateChecksView extends StatefulWidget {
  final CustomerModel customer;
  const CreateChecksView({Key? key, required this.customer}) : super(key: key);

  @override
  State<CreateChecksView> createState() => _CreateChecksViewState();
}

class _CreateChecksViewState extends State<CreateChecksView> {
  String currentKey = '';
  List<CheckQrModel> currentValue = [];
  @override
  void initState() {
    for (var item in getIt.get<ItemsMobx>().items) {
      if (widget.customer.oid == item.musteriID) {
        currentValue.add(CheckQrModel(
            controller: TextEditingController(),
            item: item,
            name: widget.customer.musteriFirmaAdi ?? ' ',
            quantity: 0));
      } else {
        return;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final int? quantity = await context.router.push<int>(ScanQrCodeRoute(
              item: currentValue
                  .where((element) => element.name == currentKey)
                  .first
                  .item,
              counter: currentValue
                  .where((element) => element.name == currentKey)
                  .first
                  .quantity));
          currentValue
              .where((element) => element.name == currentKey)
              .first
              .quantity = quantity!;
          currentValue
              .where((element) => element.name == currentKey)
              .first
              .controller
              .text = quantity.toString();
          setState(() {});
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
          children: <Widget>[
            const Bodylarge(data: 'Sayım Başlat'),
            DropdownButtonFormField2(
              value: currentKey,
              onChanged: (value) {
                setState(() {
                  currentKey = value!;
                });
              },
              items: [
                ...getIt
                    .get<ItemsMobx>()
                    .items
                    .where(
                        (element) => widget.customer.oid == element.musteriID)
                    .toList()
                    .map<DropdownMenuItem<String>>((e) =>
                        DropdownMenuItem(child: Bodymedium(data: e.adi ?? ' ')))
                    .toList()
              ],
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              hint: const Bodymedium(data: 'Malzeme Seç'),
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(FontAwesomeIcons.arrowDown)),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              itemCount: currentValue.length,
              shrinkWrap: true,
              primary: false,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: currentValue[index].controller,
                    readOnly: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 8.0,
                        )),
                  ),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
