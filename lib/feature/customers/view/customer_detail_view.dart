import 'package:aden_envanterus/core/widgets/bodylarge.dart';
import 'package:aden_envanterus/core/widgets/bodymedium.dart';
import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:aden_envanterus/models/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:kartal/kartal.dart';

class CustomerDetailView extends StatefulWidget {
  final CustomerModel customer;
  const CustomerDetailView({Key? key, required this.customer})
      : super(key: key);

  @override
  State<CustomerDetailView> createState() => _CustomerDetailViewState();
}

class _CustomerDetailViewState extends State<CustomerDetailView> {
  late TextEditingController customerName;
  late TextEditingController authorityName;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController adress;
  late TextEditingController taxPlace;
  late TextEditingController taxNo;
  late String status;
  @override
  void initState() {
    customerName = TextEditingController();
    authorityName = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();

    adress = TextEditingController();
    taxPlace = TextEditingController();
    taxNo = TextEditingController();
    status = widget.customer.aktifPasif == 0 ? 'Pasif' : 'Aktif';
    customerName.text = widget.customer.musteriFirmaAdi ?? ' ';
    authorityName.text = widget.customer.musteriYetkili ?? ' ';
    phone.text = widget.customer.musteriTelefon ?? ' ';
    email.text = widget.customer.musteriEmail ?? ' ';
    adress.text = widget.customer.musteriAdres ?? ' ';
    taxPlace.text = widget.customer.musteriVergiDaire ?? ' ';
    taxNo.text = widget.customer.musteriVergiNo ?? ' ';
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Müşteri Detay'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Bodymedium(data: 'Müşteri Adı :'),
            const SizedBox(height: 10),
            TextFormField(
              controller: customerName,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(height: 10),
            const Bodymedium(data: 'Yetkili :'),
            const SizedBox(height: 10),
            TextFormField(
              controller: authorityName,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(height: 10),
            const Bodymedium(data: 'Telefon :'),
            const SizedBox(height: 10),
            TextFormField(
              controller: phone,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(height: 10),
            const Bodymedium(data: 'e-Mail Adresi :'),
            const SizedBox(height: 10),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(height: 10),
            const Bodymedium(data: 'Adres:'),
            const SizedBox(height: 10),
            TextFormField(
              controller: adress,
              maxLines: 4,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(height: 10),
            const Bodymedium(data: 'Vergi Dairesi :'),
            const SizedBox(height: 10),
            TextFormField(
              controller: taxPlace,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(height: 10),
            const Bodymedium(data: 'Vergi No :'),
            const SizedBox(height: 10),
            TextFormField(
              controller: taxNo,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(height: 10),
            const Bodymedium(data: 'Müşteri Adı'),
            const SizedBox(height: 10),
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
                  items: [
                    'Aktif',
                    'Pasif',
                  ]
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
                  child: const Bodylarge(
                    data: 'Düzenle',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
