import '../../../core/route/router_generator.dart';
import '../../../core/service/dependecy_service.dart';
import '../../../core/service/shared_references.dart';
import '../../../core/util/extension.dart';
import '../../../core/widgets/bodylarge.dart';
import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/headline6.dart';
import '../view_model/get_login.dart';
import '../../../models/check_detail_service.dart';
import '../../../models/checks_service.dart';

import '../../../models/customer_service.dart';
import '../../../models/items_model.dart';
import '../../../models/member_service.dart';
import '../../../models/projects_service.dart';
import '../../../models/user_session.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kartal/kartal.dart';

import '../../../models/items_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late FocusNode email;
  late FocusNode password;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isLoading = false;
  bool isError = false;
  @override
  void initState() {
    email = FocusNode();
    password = FocusNode();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  bool isClickEye = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 16.0),
        //     child: TextButton(
        //       onPressed: () {
        //         context.router.push(const SignUpRoute());
        //       },
        //       child: const Bodymedium(
        //         data: "Kay??t Ol",
        //         color: Colors.red,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //   ),
        // ],
        title: const Headline6(data: "Giri?? Yap"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Headline6(data: "Hesab??na Giri?? Yapabilirsin"),
              const SizedBox(height: 20),
              const Bodymedium(
                  textalign: TextAlign.center,
                  opacity: .6,
                  data:
                      'A??a????daki do??rulamay?? do??rulayarak hesab??na giri?? yapabilrisin'),
              const SizedBox(height: 20),
              CustomTextField(
                controller: emailController,
                hintext: 'Email',
                focusNode: email,
                inputType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email),
              ),
              const SizedBox(height: 40),
              CustomTextField(
                controller: passwordController,
                hintext: '??ifre',
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
              Bodylarge(
                data: '??ifremi Unuttum ?',
                color: context.colorScheme.error,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: GFButton(
                  shape: GFButtonShape.pills,
                  fullWidthButton: true,
                  size: GFSize.LARGE,
                  type: GFButtonType.solid,
                  onPressed: () async {
                    isLoading = true;
                    setState(() {});
                    final isLogin = await getIt
                        .get<AuthenticateUser>()
                        .authenticaceUser(
                            email: getIt.get<AuthenticateUser>().email,
                            pasword: getIt.get<AuthenticateUser>().password);

                    if (isLogin == 'true') {
                      isError = false;
                     await AuthenticateUser.getAllData();
                      context.router.push(const RootRoute());
                    } else {
                      isLoading = false;
                      isError = true;
                      setState(() {});

                      return;
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Bodylarge(
                          data: "Giri?? Yap",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                ),
              ),
              const SizedBox(height: 10),
              Visibility(
                visible: isError,
                child: Bodymedium(
                  data: 'Kullan??c?? ya da ??ifre yanl????',
                  color: context.colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
