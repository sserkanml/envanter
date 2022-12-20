import 'package:aden_envanterus/core/widgets/bodymedium.dart';
import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:aden_envanterus/models/checks_detail_model.dart';
import 'package:aden_envanterus/models/checks_model.dart';
import 'package:aden_envanterus/models/customer_model.dart';
import 'package:aden_envanterus/models/items_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';

import 'package:kartal/kartal.dart';

class CheckDetailView extends StatefulWidget {
  final CustomerModel customer;
  final ItemsModel item;
  final CheckModel check;
  final CheckDetailModel checkDetail;

  const CheckDetailView(
      {Key? key,
      required this.customer,
      required this.item,
      required this.checkDetail,
      required this.check})
      : super(key: key);

  @override
  State<CheckDetailView> createState() => _CheckDetailViewState();
}

class _CheckDetailViewState extends State<CheckDetailView> {
  late TextEditingController customerName;
  late TextEditingController checkCount;
  late TextEditingController item;
  late TextEditingController startDate;
  late TextEditingController endDate;
  late TextEditingController shortExplanation;
  late TextEditingController detailExplanation;
  late TextEditingController companyLocation;

  @override
  void initState() {
    customerName = TextEditingController();
    checkCount = TextEditingController();
    startDate = TextEditingController();
    endDate = TextEditingController();

    item = TextEditingController();
    companyLocation = TextEditingController();
    shortExplanation = TextEditingController();
    detailExplanation = TextEditingController();
    shortExplanation.text = widget.checkDetail.aciklama ?? '';
    detailExplanation.text = widget.checkDetail.detayAciklama ?? '';
    item.text = widget.item.adi ?? '';
    customerName.text = widget.customer.musteriFirmaAdi ?? ' ';
    checkCount.text = widget.customer.musteriFirmaAdi ?? ' ';

    var rawStart = widget.checkDetail.baslamaTarihi;
    var numericStart = rawStart?.split('(')[1].split(')')[0];
    var negativeStart = numericStart?.contains('-');
    var partsStart = numericStart?.split(negativeStart! ? '-' : '+');
    var millisStart = int.parse(partsStart![0]);
    var local = DateTime.fromMillisecondsSinceEpoch(millisStart);

    var rawEnd = widget.checkDetail.bitisTarihi;
    var numericEnd = rawEnd?.split('(')[1].split(')')[0];
    var negativeEnd = numericEnd?.contains('-');
    var partsEnd = numericEnd?.split((negativeEnd ?? false) ? '-' : '+');
    var millisEnd = int.parse(partsEnd![0]);
    var localEnd = DateTime.fromMillisecondsSinceEpoch(millisEnd);

    endDate.text =
        '${localEnd.day < 10 ? '0${localEnd.day}' : localEnd.day.toString()}/${localEnd.month < 10 ? '0${localEnd.month}' : localEnd.month.toString()}/${localEnd.year}';

    startDate.text =
        '${local.day < 10 ? '0${local.day}' : local.day.toString()}/${local.month < 10 ? '0${local.month}' : local.month.toString()}/${local.year}';

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String status = 'İşlem Seçiniz';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Sayım Detay'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: widget.item.adi,
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 17)),
              TextSpan(
                  text: ' Malzeme Sayım Detayları',
                  style: TextStyle(color: context.colorScheme.onSurface)),
            ])),
            const SizedBox(height: 30),
            const Bodymedium(data: 'Firma Adı:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: customerName,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Malzeme:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: item,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Başlangıç Tarihi:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onTap: () {},
              readOnly: true,
              controller: startDate,
              decoration: InputDecoration(
                  suffixIcon: Icon(FontAwesomeIcons.calendar,
                      color: context.colorScheme.onSurface.withOpacity(.5)),
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Bitiş Tarihi:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              readOnly: true,
              onTap: () {},
              controller: endDate,
              decoration: InputDecoration(
                  suffixIcon: Icon(FontAwesomeIcons.calendar,
                      color: context.colorScheme.onSurface.withOpacity(.5)),
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Kısa Açıklama:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 6,
              controller: shortExplanation,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Detay Açıklama:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 10,
              controller: detailExplanation,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Firma Lokasyon:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: companyLocation,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'İşlem Seçiniz'),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: DropdownButtonHideUnderline(
                child: GFDropdown(
                  padding: const EdgeInsets.all(15),
                  borderRadius: BorderRadius.circular(5),
                  border: BorderSide(
                      color: context.colorScheme.onSurface.withOpacity(.5),
                      width: .3),
                  dropdownButtonColor: Colors.transparent,
                  value: status,
                  onChanged: (dynamic newValue) {
                    setState(() {
                      status = newValue!;
                    });
                  },
                  items: [ 'İşlem Seçiniz','Onay', 'Beklemeye Al', 'İptal Et']
                      .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                const Spacer(),
                GFButton(
                  onPressed: () {},
                  child: const Bodymedium(
                    data: 'Düzenle',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}