import 'package:aden_envanterus/core/route/router_generator.dart';
import 'package:aden_envanterus/core/util/extension.dart';
import 'package:aden_envanterus/core/widgets/headline5.dart';
import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:aden_envanterus/feature/start/model/on_board_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoOnboarding(
        pageTransitionAnimationCurve: Curves.bounceOut,
        bottomButtonChild: const Padding(
          padding: EdgeInsets.all(2),
          child: Headline6(
            data: "İlerle",
            color: Colors.white,
          ),
        ),
        onPressedOnLastPage: () => context.router.push(const LoginRoute()),
        pages: [
          ...List.generate(
            onboardData.length,
            (index) {
              return CupertinoOnboardingPage(
                  title: Headline5(
                    data: onboardData[index].title,
                    fontWeight: FontWeight.bold,
                  ),
                  body: Column(
                    children: <Widget>[
                      SvgPicture.asset(
                        context.getPath(
                            folder: "svg", file: onboardData[index].file),
                        width: 300,
                        height: 300,
                      )
                    ],
                  ));
            },
          )
        ]);
  }
}
