import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kartal/kartal.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

import '../../../core/route/router_generator.dart';
import '../../../core/service/dependecy_service.dart';
import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/bodysmall.dart';
import '../../../core/widgets/headline6.dart';
import '../../../models/customer_service.dart';
import '../../../models/projects_service.dart';
import '../../authentication/view_model/get_login.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({Key? key}) : super(key: key);

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  final _controller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _controller.stream;

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  Future<void> _refresh() async {
    await AuthenticateUser.getAllData();
    
    _controller.sink.add(SwipeRefreshState.hidden);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Projeler'),
        leading: const Icon(FontAwesomeIcons.barsProgress),
      ),
      body: SwipeRefresh.cupertino(
          refreshIndicatorExtent: 50,
          refreshTriggerPullDistance: 50,
          stateStream: _stream,
          onRefresh: _refresh,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Bodymedium(data: 'Tüm Projeler'),
                      GFButton(
                        onPressed: () async {
                          await context.router
                              .push(const CreateProjectsRoute());
                          setState(() {});
                        },
                        child: Row(
                          children: const [
                            Icon(
                              FontAwesomeIcons.plus,
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
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: const [
                  //     InfoWidget(title: 'Dosyalar', data: '2'),
                  //     InfoWidget(title: 'Projeler', data: '2'),
                  //     InfoWidget(title: 'Toplam Miktar', data: '2'),
                  //     InfoWidget(title: 'Toplam Tutar', data: '2'),
                  //   ],
                  // ),
                  AnimationLimiter(
                    child: GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.only(top: 20),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 230,
                      ),
                      itemCount: getIt.get<ProjectsMobx>().projects.length,
                      itemBuilder: (BuildContext context, int index) {
                        var rawStart = getIt
                            .get<ProjectsMobx>()
                            .projects[index]
                            .kayitZamani;
                        var numericStart =
                            rawStart?.split('(')[1].split(')')[0];
                        var negativeStart = numericStart?.contains('-');
                        var partsStart =
                            numericStart?.split(negativeStart! ? '-' : '+');
                        var millisStart = int.parse(partsStart![0]);
                        var local =
                            DateTime.fromMillisecondsSinceEpoch(millisStart);

                        String date =
                            '${local.day < 10 ? '0${local.day}' : local.day.toString()}/${local.month < 10 ? '0${local.month}' : local.month.toString()}/${local.year}';
                        return AnimationConfiguration.staggeredGrid(
                            position: index,
                            columnCount: 2,
                            child: ScaleAnimation(
                                child: FadeInAnimation(
                                    child: Card(
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Bodymedium(
                                        data: getIt
                                                .get<ProjectsMobx>()
                                                .projects[index]
                                                .kaydeden ??
                                            ''),
                                    const SizedBox(height: 5),
                                    Bodysmall(
                                      data: 'Atayan Kullanıcı',
                                      color: context.colorScheme.onSurface
                                          .withOpacity(.3),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    // getIt
                                    //         .get<ProjectsMobx>()
                                    //         .projects[index]
                                    //         .projeResim
                                    //         .isNullOrEmpty
                                    //     ? Image.asset(
                                    //         context.getPath(
                                    //             folder: 'images',
                                    //             file: 'resimyok.png'),
                                    //         width: context.dynamicWidth(1),
                                    //         height: 140,
                                    //         fit: BoxFit.cover,
                                    //       )
                                    //     : Image.network(
                                    //         'http://envanter.sgktesvikrehberi.com/Content/Upload/${getIt.get<ProjectsMobx>().projects[index].projeResim}',
                                    //         width: context.dynamicWidth(1),
                                    //         height: 140,
                                    //         fit: BoxFit.cover,
                                    //       )
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Bodymedium(
                                        data: getIt
                                                .get<ProjectsMobx>()
                                                .projects[index]
                                                .projeAdi ??
                                            ''),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Bodymedium(data: date),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    GFButton(
                                      onPressed: () {
                                        context.router.push(ProjectsDetailRoute(
                                            projectsId: getIt
                                                .get<CustomerMobx>()
                                                .customers
                                                .where((element) =>
                                                    element.projeID ==
                                                    getIt
                                                        .get<ProjectsMobx>()
                                                        .projects[index]
                                                        .oid)
                                                .firstOrNull,
                                            project: getIt
                                                .get<ProjectsMobx>()
                                                .projects[index]));
                                      },
                                      color: GFColors.WARNING,
                                      child: const Bodysmall(
                                        data: 'Detay',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
