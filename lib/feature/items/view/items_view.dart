import 'dart:async';

import 'package:aden_envanterus/core/route/router_generator.dart';
import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/core/widgets/bodylarge.dart';
import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:aden_envanterus/models/customer_service.dart';
import 'package:aden_envanterus/models/items_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kartal/kartal.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

import '../../../core/widgets/bodymedium.dart';
import '../../authentication/view_model/get_login.dart';

class ItemsView extends StatefulWidget {
  const ItemsView({Key? key}) : super(key: key);

  @override
  State<ItemsView> createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  final _controller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _controller.stream;

  Future<void> _refresh() async {
    await AuthenticateUser.getAllData();
  
    _controller.sink.add(SwipeRefreshState.hidden);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Headline6(data: 'Malzemeler'),
          actions: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: GFIconButton(
                icon: const Icon(
                  FontAwesomeIcons.pencil,
                  size: 20,
                ),
                onPressed: () {
                  context.router.push(const CreateItemsRoute());
                },
              ),
            )
          ],
        ),
        body: SwipeRefresh
            .cupertino(stateStream: _stream, onRefresh: _refresh, children: [
          ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {},
                  trailing: GFButton(
                    onPressed: () {
                      context.router.push(ItemsDetailRoute(
                          customer: getIt
                              .get<CustomerMobx>()
                              .customers
                              .where((element) =>
                                  element.oid ==
                                  getIt.get<ItemsMobx>().items[index].musteriID)
                              .first,
                          item: getIt.get<ItemsMobx>().items[index]));
                    },
                    color: GFColors.WARNING,
                    child: const Bodylarge(
                      data: 'Detay',
                      color: Colors.white,
                    ),
                  ),
                  title: Row(
                    children: [
                      Bodymedium(
                          data: '${getIt.get<CustomerMobx>().customers.firstWhereOrNull((element) => element.oid == getIt.get<ItemsMobx>().items[index].musteriID)?.musteriFirmaAdi} -- '
                                      .length >
                                  30
                              ? '${getIt.get<CustomerMobx>().customers.firstWhereOrNull((element) => element.oid == getIt.get<ItemsMobx>().items[index].musteriID)?.musteriFirmaAdi}...'
                              : '${getIt.get<CustomerMobx>().customers.firstWhereOrNull((element) => element.oid == getIt.get<ItemsMobx>().items[index].musteriID)?.musteriFirmaAdi} -- '),
                      const SizedBox(width: 20),
                      Bodymedium(
                          data: getIt
                                      .get<ItemsMobx>()
                                      .items[index]
                                      .adi!
                                      .length >
                                  30
                              ? '${getIt.get<ItemsMobx>().items[index].adi} '
                              : getIt.get<ItemsMobx>().items[index].adi ?? ' '),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 0,
                  color: context.colorScheme.onSurface.withOpacity(.3),
                );
              },
              itemCount: getIt.get<ItemsMobx>().items.length),
        ]));
  }
}
