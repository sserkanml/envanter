import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/bodysmall.dart';
import '../../../core/widgets/headline6.dart';
import '../../../models/member.dart';

class UsersDetailView extends StatefulWidget {
  final Member member;
  const UsersDetailView({Key? key, required this.member}) : super(key: key);

  @override
  _UsersDetailViewState createState() => _UsersDetailViewState();
}

class _UsersDetailViewState extends State<UsersDetailView> {
  late TextEditingController name_surname;
  late TextEditingController user_surname;
  late TextEditingController password;
  late String authorite;
  late String copy;

  @override
  void initState() {
    name_surname = TextEditingController();
    user_surname = TextEditingController();
    password = TextEditingController();
    name_surname.text = widget.member.adiSoyadi ?? '';
    copy = widget.member.yetki.toString();
    authorite = copy;
    user_surname.text = widget.member.kullaniciAdi ?? '';
    password.text = widget.member.kullaniciSifre ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(
          data: 'Kullanıcı Detay',
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Bodysmall(data: ' Adı Soyad'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: name_surname,
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
              controller: user_surname,
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
              controller: password,
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
                  value: authorite,
                  onChanged: (dynamic newValue) {
                    setState(() {
                      authorite = newValue!;
                    });
                  },
                  items: [
                    copy,
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
            const SizedBox(height: 20),
            Row(
              children: [
                const Spacer(),
                // GFButton(
                //   color: GFColors.SECONDARY,
                //   onPressed: () {},
                //   child: const Bodysmall(
                //     data: 'Proje Ata',
                //     color: Colors.white,
                //   ),
                // ),
                const SizedBox(width: 20),
                GFButton(
                  onPressed: () {},
                  child: const Bodysmall(
                    data: 'Güncelle',
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            // const Bodylarge(data: 'Kullanıcıya Atanmış Projeler')
          ],
        ),
      )),
    );
  }
}
