import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:kartal/kartal.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/bodysmall.dart';
import '../../../core/widgets/headline6.dart';
import '../view_model/form_validate_member.dart';

class CreateUserView extends StatefulWidget {
  const CreateUserView({Key? key}) : super(key: key);

  @override
  State<CreateUserView> createState() => _CreateUserViewState();
}

class _CreateUserViewState extends State<CreateUserView> {
  String dropdownValue = 'Yetki Seçiniz';
  String errorMessage = '';
  String password = '';
  String userName = '';
  String nickName = '';
  int authority = 0;
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
          key: MemberForm.memberFormKey,
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
                onSaved: (newValue) {
                  userName = newValue!;
                },
                validator: Validators.required('Bu alan boş geçilemez'),
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
                onSaved: (newValue) {
                  nickName = newValue!;
                },
                validator: Validators.required('Bu alan boş geçilemez'),
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
                onSaved: (newValue) {
                  password = newValue!;
                },
                validator: Validators.required('Bu alan boş geçilemez'),
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
              Visibility(
                  visible: errorMessage != '',
                  child: Bodymedium(
                    data: errorMessage,
                  )),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                child: GFButton(
                  fullWidthButton: true,
                  onPressed: () async {
                    // if (MemberForm.memberFormKey.currentState!.validate() &&
                    //     dropdownValue != 'Yetki Seçiniz') {
                    //   MemberForm.memberFormKey.currentState!.save();
                    //   authority = dropdownValue == 'Kullanıcı' ? 0 : 1;
                    //   await getIt.get<MemberMobx>().postData(
                    //       nameSurname: userName,
                    //       password: password,
                    //       nicknName: nickName,
                    //       authority: authority);
                    //   setState(() {
                    //     errorMessage = '';
                    //   });
                    // } else if (dropdownValue == 'Yetki Seçiniz') {
                    //   setState(() {
                    //     errorMessage = 'Bu alan boş geçilemez';
                    //   });
                    // } else {
                    //   setState(() {
                    //     errorMessage = 'Bu alan boş geçilemez';
                    //   });
                    // }
                  },
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
