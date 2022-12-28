import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/headline6.dart';
import '../../../models/customer_model.dart';
import '../../../models/items_model.dart';


class ItemsDetailView extends StatefulWidget {
  final ItemsModel item;
  final CustomerModel customer;
  const ItemsDetailView({Key? key, required this.item, required this.customer})
      : super(key: key);

  @override
  State<ItemsDetailView> createState() => _ItemsDetailViewState();
}

class _ItemsDetailViewState extends State<ItemsDetailView> {
  late TextEditingController itemName;
  late TextEditingController unit;
  late TextEditingController modelYear;
  late TextEditingController exchange;
  late TextEditingController serialNumber;
  late TextEditingController size;
  late TextEditingController brand;
  late TextEditingController model;
  late TextEditingController deadline;
  late TextEditingController startdate;
  late DateTime? deadlineTime;
  late DateTime? startingTime;
  String selectedText = 'Seçilen Resim';
  @override
  void initState() {
    itemName = TextEditingController();
    unit = TextEditingController();
    modelYear = TextEditingController();
    exchange = TextEditingController();
    size = TextEditingController();
    brand = TextEditingController();
    model = TextEditingController();
    deadline = TextEditingController();
    startdate = TextEditingController();
    startingTime = DateTime.now();
    deadlineTime = DateTime.now();
    deadline.text =
        ('${deadlineTime!.day < 10 ? '0${deadlineTime!.day}' : deadlineTime!.day.toString()}/${deadlineTime!.month < 10 ? '0${deadlineTime!.month}' : deadlineTime!.month.toString()}/${deadlineTime!.year}')
            .toString();

    startdate.text =
        ('${startingTime!.day < 10 ? '0${startingTime!.day}' : startingTime!.day.toString()}/${startingTime!.month < 10 ? '0${startingTime!.month}' : startingTime!.month.toString()}/${startingTime!.year}')
            .toString();

    unit.text = widget.item.birim ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Malzeme Detayı'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
           
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Bodymedium(data: '${widget.item.adi} --'),
                const SizedBox(width: 10),
                Bodymedium(
                  data: widget.customer.musteriFirmaAdi ?? ' ',
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                Bodymedium(
                  data: 'Barkod:${widget.item.barkod}',
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Birim :'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: unit,
              readOnly: true,
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
            const Bodymedium(data: 'Satın Alma Fiyati:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              readOnly: true,
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
            const Bodymedium(data: 'Satın Alma Döviz Cinsi:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              readOnly: true,
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
            const Bodymedium(data: 'Ebat:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              readOnly: true,
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
            const Bodymedium(data: 'Seri Numarası:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              readOnly: true,
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
            const Bodymedium(data: 'Markası:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              readOnly: true,
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
            const Bodymedium(data: 'Modeli:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              readOnly: true,
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
            const Bodymedium(data: 'Model Yılı:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              readOnly: true,
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
            const Bodymedium(data: 'Satın Alma Tarihi:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              readOnly: true,
              controller: startdate,
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    FontAwesomeIcons.calendar,
                    color: context.colorScheme.onSurface,
                  ),
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Son Kullanma Tarihi:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              readOnly: true,
              controller: deadline,
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    FontAwesomeIcons.calendar,
                    color: context.colorScheme.onSurface,
                  ),
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}
