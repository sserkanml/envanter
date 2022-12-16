import 'package:aden_envanterus/core/widgets/bodymedium.dart';
import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../../../core/widgets/bodysmall.dart';

class CreateCustomersView extends StatelessWidget {
  const CreateCustomersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Müşteri Oluştur'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Bodymedium(data: 'Lütfen Müşteri Bilgilerini Giriniz'),
            const SizedBox(
              height: 20,
            ),
            const Bodysmall(data: 'Müşteri Firma Adı :'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
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
            const Bodysmall(data: 'Yetkili Adı Soyadı : *'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
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
            const Bodysmall(data: 'e-Mail Adresi : *'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
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
            const Bodysmall(data: 'Vergi Dairesi :'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
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
            const Bodysmall(data: 'Vergi No :'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
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
            const Bodysmall(data: 'Adres :'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 6,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                const Spacer(),
                GFButton(
                  color: GFColors.DANGER,
                  onPressed: () {},
                  child: const Bodysmall(data: 'Kaydet', color: Colors.white),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
