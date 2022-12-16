import 'package:aden_envanterus/core/route/router_generator.dart';
import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/core/widgets/bodysmall.dart';
import 'package:aden_envanterus/feature/authentication/view_model/get_login.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kartal/kartal.dart';

import '../../../core/util/extension.dart';
import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/headline6.dart';
import '../widgets/info_widget.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Projeler'),
        leading: const Icon(FontAwesomeIcons.barsProgress),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Bodymedium(data: 'Tüm Projeler'),
                GFButton(
                  onPressed: () {
                    context.router.push(const CreateProjectsRoute());
                  },
                  child: Row(
                    children: const [
                      Icon(
                        FontAwesomeIcons.pencil,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Bodymedium(
                        data: 'Yeni Proje',
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                InfoWidget(title: 'Dosyalar', data: '2'),
                InfoWidget(title: 'Projeler', data: '2'),
                InfoWidget(title: 'Toplam Miktar', data: '2'),
                InfoWidget(title: 'Toplam Tutar', data: '2'),
              ],
            ),
            AnimationLimiter(
              child: GridView.builder(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.only(top: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 200,
                ),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: 2,
                      child: ScaleAnimation(
                          child: FadeInAnimation(
                              child: GFCard(
                        padding: EdgeInsets.zero,
                        titlePosition: GFPosition.start,
                        boxFit: BoxFit.cover,
                        image: Image.asset(
                          context.getPath(
                              folder: 'images', file: 'arduino.jpg'),
                          fit: BoxFit.cover,
                        ),
                        title: GFListTile(
                            padding: EdgeInsets.zero,
                            title: const Bodysmall(
                              data: 'Kullanıcı Adı',
                              fontWeight: FontWeight.bold,
                            ),
                            subTitle: Bodysmall(
                              data: 'Atanan Kullanıcı',
                              color:
                                  context.colorScheme.onSurface.withOpacity(.5),
                            ),
                            avatar: GFAvatar(
                                radius: 12,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage(context.getPath(
                                    folder: 'images', file: 'user.png')))),
                        margin: const EdgeInsets.all(5),
                      ))));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
