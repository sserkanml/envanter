import 'package:aden_envanterus/core/widgets/bodymedium.dart';
import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/bodysmall.dart';

class CreateUserView extends StatefulWidget {
  const CreateUserView({Key? key}) : super(key: key);

  @override
  State<CreateUserView> createState() => _CreateUserViewState();
}

class _CreateUserViewState extends State<CreateUserView> {
  String dropdownValue = 'Yetki Seçiniz';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Kullanıcı Oluştur'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Bodymedium(
                  data: 'Kullanıcı bilgilerini girerek bir kullanıcı oluştur'),
              const SizedBox(height: 20),
              const Bodysmall(data: ' Adı Soyad'),
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
              const SizedBox(height: 20),
              const Bodysmall(data: 'Kullanıcı Adı '),
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
              const SizedBox(height: 20),
              const Bodysmall(data: 'Şifre'),
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
              const SizedBox(height: 20),
              const Bodysmall(data: 'Yetki'),
              const SizedBox(height: 20),
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
                    value: dropdownValue,
                    onChanged: (dynamic newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: [
                      'Yetki Seçiniz',
                      'Admin',
                      'Kullanıcı',
                    ]
                        .map((value) => DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            ))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                child: GFButton(
                  fullWidthButton: true,
                  onPressed: () {},
                  child: const Bodymedium(
                    data: 'Kaydet',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
