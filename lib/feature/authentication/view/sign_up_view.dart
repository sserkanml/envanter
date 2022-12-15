import 'package:aden_envanterus/core/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/bodylarge.dart';
import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/custom_form_field.dart';
import '../../../core/widgets/headline6.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late FocusNode email;
  late FocusNode password;
  @override
  void initState() {
    email = FocusNode();
    password = FocusNode();
    super.initState();
  }

  bool isClickEye = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Headline6(data: "Kayıt Ol"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Headline6(data: "Yeni Bir Hesap Aç"),
              const SizedBox(height: 20),
              const Bodymedium(
                  textalign: TextAlign.center,
                  opacity: .6,
                  data: 'Bugün bir yeni bir hesap açarak başlayabilirsin.'),
              const SizedBox(height: 20),
              CustomTextFormField(
                hintext: 'Ad Soyad',
                focusNode: email,
                inputType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hintext: 'Email',
                focusNode: email,
                inputType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hintext: 'Şifre',
                focusNode: password,
                obscureText: isClickEye,
                inputType: TextInputType.text,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isClickEye = !isClickEye;
                    });
                  },
                  icon: SvgPicture.asset(
                    context.getPath(
                        folder: 'svg',
                        file: isClickEye ? 'eye.svg' : 'eye_close.svg'),
                    color: context.colorScheme.onSurface,
                  ),
                ),
              ),
             
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: GFButton(
                  shape: GFButtonShape.pills,
                  fullWidthButton: true,
                  size: GFSize.LARGE,
                  type: GFButtonType.solid,
                  onPressed: () {},
                  child: const Bodylarge(
                    data: "Kayıt Ol",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
