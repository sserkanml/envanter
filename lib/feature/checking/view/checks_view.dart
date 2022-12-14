import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kartal/kartal.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

import '../../../core/route/router_generator.dart';
import '../../../core/service/dependecy_service.dart';
import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/bodysmall.dart';
import '../../../core/widgets/headline6.dart';
import '../../../models/check_detail_service.dart';
import '../../../models/checks_service.dart';
import '../../../models/customer_service.dart';
import '../../../models/items_service.dart';
import '../../authentication/view_model/get_login.dart';

class ChecksView extends StatefulWidget {
  const ChecksView({Key? key}) : super(key: key);

  @override
  State<ChecksView> createState() => _ChecksViewState();
}

class _ChecksViewState extends State<ChecksView> {
  final _controller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _controller.stream;

  Future<void> _refresh() async {
    await AuthenticateUser.getAllData();

    _controller.sink.add(SwipeRefreshState.hidden);
    setState(() {});
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Sayımlar'),
      ),
      body: SafeArea(
          child: SwipeRefresh
              .cupertino(stateStream: _stream, onRefresh: _refresh, children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
                width: context.dynamicWidth(1),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    GFButton(
                      color: GFColors.SECONDARY,
                      onPressed: () {
                        context.router.push(const ItemsRoute());
                      },
                      child: const Bodysmall(
                        data: 'Malzemeler',
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20),
                    GFButton(
                      onPressed: () {
                        context.router.push(const SelectCustomerRoute());
                      },
                      child: const Bodysmall(
                        data: 'Sayım Başlat',
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20),
                    GFButton(
                      color: GFColors.WARNING,
                      onPressed: () {
                        context.router.push(const PendingCheckingRoute());
                      },
                      child: const Bodysmall(
                        data: 'Bekleyen Sayımlar',
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20),
                    GFButton(
                      color: GFColors.DANGER,
                      onPressed: () {
                        context.router.push(const CanceledCheckRoute());
                      },
                      child: const Bodysmall(
                        data: 'İptal Edilen  Sayımlar',
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20),
                    GFButton(
                      color: GFColors.SUCCESS,
                      onPressed: () {
                        context.router.push(const ConfirmedRoute());
                      },
                      child: const Bodysmall(
                        data: 'Onaylanan Sayımlar',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Arama Yap',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    )),
              ),
              const SizedBox(height: 20),
              Observer(
                
                builder:(context) {
                  return ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {},
                        trailing: TextButton(
                          onPressed: () {
                            context.router.push(CheckDetailRoute(
                                check: getIt
                                    .get<CheckMobx>()
                                    .checks
                                    .where((element) =>
                                        element.malzeme ==
                                        getIt
                                            .get<CheckDetailMobx>()
                                            .checksDetail[index]
                                            .malzeme)
                                    .first,
                                customer: getIt
                                    .get<CustomerMobx>()
                                    .customers
                                    .where((element) =>
                                        element.oid ==
                                        getIt
                                            .get<CheckDetailMobx>()
                                            .checksDetail[index]
                                            .musteriID)
                                    .first,
                                item: getIt
                                    .get<ItemsMobx>()
                                    .items
                                    .where((element) =>
                                        element.oid ==
                                        getIt
                                            .get<CheckDetailMobx>()
                                            .checksDetail[index]
                                            .malzeme)
                                    .first,
                                checkDetail: getIt
                                    .get<CheckDetailMobx>()
                                    .checksDetail
                                    .where((element) =>
                                        element.malzeme ==
                                        getIt
                                            .get<CheckMobx>()
                                            .checks[index]
                                            .malzeme)
                                    .first));
                          },
                          child: const Bodymedium(
                            data: "Detay",
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // trailing: GFButton(
                        //   onPressed: () {
                        //     context.router.push(CheckDetailRoute(
                        //         check: getIt
                        //             .get<CheckMobx>()
                        //             .checks
                        //             .where((element) =>
                        //                 element.malzeme ==
                        //                 getIt
                        //                     .get<CheckDetailMobx>()
                        //                     .checksDetail[index]
                        //                     .malzeme)
                        //             .first,
                        //         customer: getIt
                        //             .get<CustomerMobx>()
                        //             .customers
                        //             .where((element) =>
                        //                 element.oid ==
                        //                 getIt
                        //                     .get<CheckDetailMobx>()
                        //                     .checksDetail[index]
                        //                     .musteriID)
                        //             .first,
                        //         item: getIt
                        //             .get<ItemsMobx>()
                        //             .items
                        //             .where((element) =>
                        //                 element.oid ==
                        //                 getIt
                        //                     .get<CheckDetailMobx>()
                        //                     .checksDetail[index]
                        //                     .malzeme)
                        //             .first,
                        //         checkDetail: getIt
                        //             .get<CheckDetailMobx>()
                        //             .checksDetail
                        //             .where((element) =>
                        //                 element.malzeme ==
                        //                 getIt
                        //                     .get<CheckMobx>()
                        //                     .checks[index]
                        //                     .malzeme)
                        //             .first));
                        //   },
                        //   color: GFColors.WARNING,
                        //   child: const Bodysmall(
                        //     data: 'Detay',
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        title: Row(
                          children: [
                            Bodymedium(
                                fontWeight: FontWeight.bold,
                                data: (getIt
                                                .get<CustomerMobx>()
                                                .customers
                                                .firstWhereOrNull((element) =>
                                                    element.oid ==
                                                    getIt
                                                        .get<CheckDetailMobx>()
                                                        .checksDetail[index]
                                                        .musteriID)
                                                ?.musteriFirmaAdi)!
                                            .length >
                                        30
                                    ? (getIt
                                            .get<CustomerMobx>()
                                            .customers
                                            .firstWhereOrNull((element) =>
                                                element.oid ==
                                                getIt
                                                    .get<CheckDetailMobx>()
                                                    .checksDetail[index]
                                                    .musteriID)
                                            ?.musteriFirmaAdi)!
                                        .substring(0, 30)
                                    : (getIt
                                            .get<CustomerMobx>()
                                            .customers
                                            .firstWhereOrNull((element) =>
                                                element.oid ==
                                                getIt
                                                    .get<CheckDetailMobx>()
                                                    .checksDetail[index]
                                                    .musteriID)
                                            ?.musteriFirmaAdi) ??
                                        ''),
                            const SizedBox(width: 5),
                            Bodysmall(
                                data:
                                    '(${getIt.get<ItemsMobx>().items.firstWhereOrNull((element) => element.oid == getIt.get<CheckDetailMobx>().checksDetail[index].malzeme)?.adi})')
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 0,
                        color: context.colorScheme.onSurface.withOpacity(.08),
                      );
                    },
                    itemCount: getIt.get<CheckMobx>().checks.length);
                }, 
              )
            ],
          ),
        ),
      ])),
    );
  }
}
