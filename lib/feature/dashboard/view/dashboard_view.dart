import 'dart:async';

import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/feature/dashboard/model/get_assigned_project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:kartal/kartal.dart';
import 'package:swipe_refresh/swipe_refresh.dart';
import 'package:tab_container/tab_container.dart';

import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/bodysmall.dart';
import '../../../core/widgets/headline6.dart';
import '../../authentication/view_model/get_login.dart';
import '../model/tab_model.dart';
import '../widgets/tabs_child.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late TabContainerController tabcontroller;

  final _controller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _controller.stream;
  @override
  void initState() {
    tabcontroller = TabContainerController(length: 4);
    tabcontroller.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    tabcontroller.removeListener(() {});
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
        automaticallyImplyLeading: false,
        title: const Headline6(data: 'Dashboard'),
      ),
      body: SafeArea(
          child: SwipeRefresh.cupertino(
        stateStream: _stream,
        refreshIndicatorExtent: 60,
        refreshTriggerPullDistance: 100,
        onRefresh: _refresh,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    height: 200,
                    width: context.dynamicWidth(1),
                    child: TabContainer(
                      transitionBuilder: (child, animation) {
                        animation = CurvedAnimation(
                            curve: Curves.easeIn, parent: animation);
                        return SlideTransition(
                          position: Tween(
                            begin: const Offset(0.2, 0.0),
                            end: const Offset(0.0, 0.0),
                          ).animate(animation),
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                      controller: tabcontroller,
                      tabs: [
                        ...List.generate(
                          tabs.length,
                          (index) {
                            return Icon(tabs[index].icon,
                                color: tabcontroller.index == index
                                    ? context.colorScheme.onPrimary
                                    : context.colorScheme.onBackground);
                          },
                        )
                      ],
                      isStringTabs: false,
                      tabEdge: TabEdge.right,
                      tabCurve: Curves.easeIn,
                      colors: const <Color>[
                        Color(0xfffa86be),
                        Color(0xffa275e3),
                        Color(0xff251749),
                        Color(0xffdc5d5a)
                      ],
                      children: getChildrenTabs(context),
                    )),
                const SizedBox(
                  height: 40,
                ),
                const Headline6(data: 'Bana Atanan Projeler'),
                const SizedBox(height: 10),
                SizedBox(
                    height: 240,
                    child: getIt.get<GetAssignedProjectMobx>().projects.isEmpty
                        ? const Card(
                            elevation: 1,
                            child: Center(
                              child:
                                  Bodymedium(data: 'Atanan Proje Bulunamadı'),
                            ),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var rawStart = getIt
                                  .get<GetAssignedProjectMobx>()
                                  .projects[index]
                                  .kayitZamani;
                              var numericStart =
                                  rawStart?.split('(')[1].split(')')[0];
                              var negativeStart = numericStart?.contains('-');
                              var partsStart = numericStart
                                  ?.split(negativeStart! ? '-' : '+');
                              var millisStart = int.parse(partsStart![0]);
                              var local = DateTime.fromMillisecondsSinceEpoch(
                                  millisStart);

                              String date =
                                  '${local.day < 10 ? '0${local.day}' : local.day.toString()}/${local.month < 10 ? '0${local.month}' : local.month.toString()}/${local.year}';
                              return AnimationConfiguration.staggeredList(
                                  position: index,
                                  child: ScaleAnimation(
                                      child: FadeInAnimation(
                                          child: SizedBox(
                                    width: 175,
                                    child: Card(
                                      elevation: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Bodymedium(
                                                data: getIt
                                                        .get<
                                                            GetAssignedProjectMobx>()
                                                        .projects[index]
                                                        .kaydeden ??
                                                    ''),
                                            const SizedBox(height: 5),
                                            Bodysmall(
                                              data: 'Atayan Kullanıcı',
                                              color: context
                                                  .colorScheme.onSurface
                                                  .withOpacity(.3),
                                              fontWeight: FontWeight.bold,
                                            ),
                                            const SizedBox(height: 5),
                                            getIt
                                                    .get<
                                                        GetAssignedProjectMobx>()
                                                    .projects[index]
                                                    .projeResim
                                                    .isNullOrEmpty
                                                ? Expanded(
                                                    child: Container(
                                                    color: context
                                                        .colorScheme.onSurface
                                                        .withOpacity(.07),
                                                  ))
                                                : Expanded(
                                                    child: Image.network(
                                                      'http://envanter.sgktesvikrehberi.com/Content/img/${getIt.get<GetAssignedProjectMobx>().projects[index].projeResim}',
                                                      width: context
                                                          .dynamicWidth(1),
                                                      height: 100,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Bodymedium(
                                                data: getIt
                                                        .get<
                                                            GetAssignedProjectMobx>()
                                                        .projects[index]
                                                        .projeAdi ??
                                                    ''),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Bodymedium(data: date),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))));
                            },
                            itemCount: getIt
                                    .get<GetAssignedProjectMobx>()
                                    .projects
                                    .isEmpty
                                ? 1
                                : getIt
                                    .get<GetAssignedProjectMobx>()
                                    .projects
                                    .length,
                          ))
              ],
            ),
          ),
        ],
      )),
    );
  }
}
