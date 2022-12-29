import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:swipe_refresh/swipe_refresh.dart';
import 'package:tab_container/tab_container.dart';

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
                // const Headline6(data: 'Son Eklenen Projeler'),
                // SizedBox(
                //     height: 240,
                //     child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         return const SizedBox(
                //           width: 200,
                //           child: Card(
                //             color: Colors.red,
                //             margin:
                //                 EdgeInsets.only(top: 20, bottom: 20, right: 20),
                //           ),
                //         );
                //       },
                //       itemCount: 5,
                //     ))
              ],
            ),
          ),
        ],
      )),
    );
  }
}
