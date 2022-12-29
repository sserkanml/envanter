import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:getwidget/getwidget.dart';

import '../../../core/route/router_generator.dart';
import '../../../core/service/dependecy_service.dart';
import '../../../core/service/shared_references.dart';
import '../../../core/widgets/bodylarge.dart';
import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/bodysmall.dart';
import '../../../core/widgets/headline6.dart';
import '../model/settings_title_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Ayarlar'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: AnimationLimiter(
          child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: settingtitle.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: index == 0
                        ? Column(
                            children: [
                              GFCard(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                padding: const EdgeInsets.all(3),
                                title: GFListTile(
                                  padding: EdgeInsets.zero,
                                  title: const Bodysmall(data: 'Karanlık Tema'),
                                  icon: GFToggle(
                                    onChanged: (val) {
                                      if (AdaptiveTheme.of(context).mode ==
                                          AdaptiveThemeMode.light) {
                                        AdaptiveTheme.of(context).setDark();
                                      } else {
                                        AdaptiveTheme.of(context).setLight();
                                      }
                                    },
                                    value: AdaptiveTheme.of(context).mode ==
                                            AdaptiveThemeMode.light
                                        ? false
                                        : true,
                                    type: GFToggleType.ios,
                                  ),
                                ),
                              ),
                              GFCard(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                padding: const EdgeInsets.all(3),
                                title: GFListTile(
                                  onTap: () async {
                                    if (settingtitle[index].name ==
                                        'Kullanıcılar') {
                                     
                                      context.router
                                          .push(settingtitle[index].page);
                                    } else if (settingtitle[index].name ==
                                        'Çıkış Yap') {
                                      final result = await showDialog<bool>(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            actions: [
                                              GFButton(
                                                color: GFColors.DANGER,
                                                fullWidthButton: true,
                                                onPressed: () {
                                                  context.router
                                                      .pop<bool>(false);
                                                },
                                                child: const Bodymedium(
                                                  data: 'İptal Et',
                                                  color: Colors.white,
                                                ),
                                              ),
                                              GFButton(
                                                color: GFColors.INFO,
                                                fullWidthButton: true,
                                                onPressed: () {
                                                  context.router
                                                      .pop<bool>(true);
                                                },
                                                child: const Bodymedium(
                                                  data: 'Çıkış Yap',
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                            content: const Bodymedium(
                                                data:
                                                    'Yaptığın değişikleri kaydetdiginden emin ol !'),
                                            title: const Bodylarge(
                                                data:
                                                    'Hesabından  Çıkmak İstediğinden Emin misin ?'),
                                          );
                                        },
                                      );
                                      if (result ?? false) {
                                      
                                        context.router
                                            .push(const OnBoardRoute());
                                      } else {
                                        return;
                                      }
                                    } else {
                                      context.router
                                          .push(settingtitle[index].page);
                                    }
                                  },
                                  icon: Icon(settingtitle[index].icon),
                                  title: Bodymedium(
                                      data: settingtitle[index].name),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ],
                          )
                        : GFCard(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            padding: const EdgeInsets.all(3),
                            title: GFListTile(
                              onTap: () async {
                                if (settingtitle[index].name ==
                                    'Kullanıcılar') {
                                
                                  context.router.push(settingtitle[index].page);
                                } else if (settingtitle[index].name ==
                                    'Çıkış Yap') {
                                  final result = await showDialog<bool>(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: [
                                          GFButton(
                                            color: GFColors.DANGER,
                                            fullWidthButton: true,
                                            onPressed: () {
                                              context.router.pop<bool>(false);
                                            },
                                            child: const Bodymedium(
                                              data: 'İptal Et',
                                              color: Colors.white,
                                            ),
                                          ),
                                          GFButton(
                                            color: GFColors.INFO,
                                            fullWidthButton: true,
                                            onPressed: () {
                                              context.router.pop<bool>(true);
                                            },
                                            child: const Bodymedium(
                                              data: 'Çıkış Yap',
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                        content: const Bodymedium(
                                            data:
                                                'Yaptığın değişikleri kaydetdiginden emin ol !'),
                                        title: const Bodylarge(
                                            data:
                                                'Hesabından  Çıkmak İstediğinden Emin misin ?'),
                                      );
                                    },
                                  );
                                  if (result ?? false) {
                                    getIt
                                        .get<Shared>()
                                        .pref
                                        .setBool('isLogin', false);
                                    getIt
                                        .get<Shared>()
                                        .pref
                                        .setString('sessionID', '');
                                    context.router.push(const OnBoardRoute());
                                  } else {
                                    return;
                                  }
                                } else {
                                  context.router.push(settingtitle[index].page);
                                }
                              },
                              icon: Icon(settingtitle[index].icon),
                              title: Bodymedium(data: settingtitle[index].name),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                  ),
                ),
              );
            },
          ),
        ),
      )),
    );
  }
}
