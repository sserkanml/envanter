import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:kartal/kartal.dart';

import '../../../core/route/router_generator.dart';
import '../../../core/service/dependecy_service.dart';
import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/bodysmall.dart';
import '../../../core/widgets/headline6.dart';
import '../../../models/check_detail_service.dart';
import '../../../models/checks_detail_model.dart';
import '../../../models/checks_service.dart';
import '../../../models/customer_service.dart';
import '../../../models/items_service.dart';

class PendingCheckingView extends StatefulWidget {
  const PendingCheckingView({Key? key}) : super(key: key);

  @override
  State<PendingCheckingView> createState() => _PendingCheckingViewState();
}

class _PendingCheckingViewState extends State<PendingCheckingView> {
  List<CheckDetailModel> pendingCheckDetail = [];
  @override
  void initState() {
    pendingCheckDetail = getIt
        .get<CheckDetailMobx>()
        .checksDetail
        .where((element) => element.onayDurum == 2)
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Bekleyen Sayımlar'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
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
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    trailing: GFButton(
                      onPressed: () {
                        context.router.push(CheckDetailRoute(
                            check: getIt
                                .get<CheckMobx>()
                                .checks
                                .where((element) =>
                                    element.malzeme ==
                                    pendingCheckDetail[index].malzeme)
                                .first,
                            customer: getIt
                                .get<CustomerMobx>()
                                .customers
                                .where((element) =>
                                    element.oid ==
                                    pendingCheckDetail[index].musteriID)
                                .first,
                            item: getIt
                                .get<ItemsMobx>()
                                .items
                                .where((element) =>
                                    element.oid ==
                                    pendingCheckDetail[index].malzeme)
                                .first,
                            checkDetail: getIt
                                .get<CheckDetailMobx>()
                                .checksDetail
                                .where((element) =>
                                    element.malzeme ==
                                    pendingCheckDetail[index].malzeme)
                                .first));
                      },
                      color: GFColors.WARNING,
                      child: const Bodysmall(
                        data: 'Detay',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Row(
                      children: [
                        Bodymedium(
                            fontWeight: FontWeight.bold,
                            data: getIt
                                    .get<CustomerMobx>()
                                    .customers
                                    .firstWhereOrNull((element) =>
                                        element.oid ==
                                        pendingCheckDetail[index].musteriID)
                                    ?.musteriFirmaAdi ??
                                ''),
                        const SizedBox(width: 5),
                        Bodysmall(
                            data:
                                '(${getIt.get<ItemsMobx>().items.firstWhereOrNull((element) => element.oid == pendingCheckDetail[index].malzeme)?.adi})')
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: context.colorScheme.onSurface,
                  );
                },
                itemCount: pendingCheckDetail.length)
          ],
        ),
      )),
    );
  }
}
