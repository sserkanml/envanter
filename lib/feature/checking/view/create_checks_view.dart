import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:kartal/kartal.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../core/route/router_generator.dart';
import '../../../core/service/dependecy_service.dart';
import '../../../core/util/extension.dart';
import '../../../core/widgets/bodylarge.dart';
import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/bodysmall.dart';
import '../../../core/widgets/headline6.dart';
import '../../../models/check_detail_service.dart';
import '../../../models/checks_detail_model.dart';
import '../../../models/checks_model.dart';
import '../../../models/checks_service.dart';
import '../../../models/customer_model.dart';
import '../../../models/customer_service.dart';
import '../../../models/items_service.dart';
import '../model/check_qr_model.dart';

class CreateChecksView extends StatefulWidget {
  final CustomerModel customer;
  const CreateChecksView({Key? key, required this.customer}) : super(key: key);

  @override
  State<CreateChecksView> createState() => _CreateChecksViewState();
}

class _CreateChecksViewState extends State<CreateChecksView> {
  late List<CheckQrModel> itemsQr;
  List<CheckQrModel> names = [];
  List<CheckQrModel> doneList = [];
  List<CheckQrModel> sentList = [];
  List<CheckDetailModel> checkDetail = [];
  List<CheckModel> checks = [];
  String currentValue = '';
  @override
  void initState() {
    if (getIt
        .get<ItemsMobx>()
        .items
        .any((element) => element.musteriID == widget.customer.oid)) {
      itemsQr = getIt
          .get<ItemsMobx>()
          .items
          .where((element) => element.musteriID == widget.customer.oid)
          .toList()
          .map<CheckQrModel>((e) => CheckQrModel(
              controller: TextEditingController(),
              item: e,
              name: e.adi ?? ' ',
              quantity: getIt
                      .get<CheckMobx>()
                      .checks
                      .firstWhereOrNull((element) => element.malzeme == e.oid)
                      ?.miktar ??
                  0))
          .toList();

      for (var element in itemsQr) {
        if (element.quantity == 0) {
          names.add(element);
          element.controller.text = element.quantity.toInt().toString();
        }
        element.controller.text = element.quantity.toInt().toString();
      }
      if (names.isNotEmpty) {
        currentValue = names[0].name;
      }
      // ignore: avoid_function_literals_in_foreach_calls
      itemsQr.forEach((element) {
        if (element.quantity > 0) {
          sentList.add(element);
          checkDetail = getIt
              .get<CheckDetailMobx>()
              .checksDetail
              .where((element) => element.musteriID == widget.customer.oid)
              .toList();
        } else {}
      });
    } else {
      itemsQr = [];
      names = [];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: names.isEmpty
          ? null
          : FloatingActionButton(
              onPressed: () async {
                final double? data = await context.router.push<double>(
                    ScanQrCodeRoute(
                        qrModel: itemsQr
                            .where((element) => element.name == currentValue)
                            .first));
                itemsQr
                    .where((element) => element.name == currentValue)
                    .first
                    .quantity = data ?? 0;
                itemsQr
                    .where((element) => element.name == currentValue)
                    .first
                    .controller
                    .text = (data?.toInt() ?? 0).toString();
                if (data == 0) {
                } else {
                  if (doneList.isEmpty) {
                  } else {
                    // ignore: avoid_function_literals_in_foreach_calls
                    doneList.forEach((element) {
                      if (element.name == currentValue) {
                        element.quantity = data ?? 0;
                      } else {
                        doneList.add(names.firstWhere(
                            (element) => element.name == currentValue));
                      }
                    });
                  }
                }
                setState(() {});
              },
              child: SvgPicture.asset(
                context.getPath(folder: 'svg', file: 'qr_code.svg'),
                color: Colors.white,
                width: 30,
                height: 30,
              ),
            ),
      appBar: AppBar(
        title: const Headline6(data: 'Sayım Oluştur'),
        leading: IconButton(
          onPressed: () {
            context.router
                .popUntil((route) => route.settings.name == ChecksRoute.name);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: itemsQr.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    context.getPath(folder: 'svg', file: 'notFound.svg'),
                    width: 200,
                    height: 200,
                    color: context.colorScheme.onSurface.withOpacity(.4),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Bodylarge(
                      data: 'Malzeme bulunamadı...',
                      color: context.colorScheme.onSurface.withOpacity(.4)),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Bodylarge(data: 'Sayım Başlat'),
                        GFButton(
                          onPressed: doneList.isEmpty
                              ? null
                              : () async {
                                  // ignore: avoid_function_literals_in_foreach_calls
                                  doneList.forEach((element) async {
                                    await getIt.get<CheckMobx>().createCheck(
                                        item_id: element.item.oid!,
                                        customer_id: element.item.musteriID!,
                                        quantity: element.quantity
                                            .toInt()
                                            .toString());
                                  });

                                  if (getIt.get<CheckMobx>().infoMessage ==
                                      "Sayım Kayıt Olmuştur") {
                                    MotionToast.success(
                                        description: const Bodymedium(
                                      data: 'İşlem Başarıyla Kaydedildi',
                                    )).show(context);
                                    getIt.get<CheckMobx>().infoMessage = '';
                                  } else {
                                    MotionToast.error(
                                        description: const Bodymedium(
                                      data: 'İşlem Kaydedilemedi',
                                    )).show(context);
                                    getIt.get<CheckMobx>().infoMessage = '';
                                  }

                                  await Future.delayed(
                                      const Duration(milliseconds: 3000), (() {
                                    context.router.pop();
                                  }));
                                },
                          child: const Bodymedium(
                            data: 'Kaydet',
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  names.isEmpty
                      ? const SizedBox()
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 0),
                          child: DropdownButton2<String>(
                            dropdownMaxHeight: 200,
                            value: currentValue,
                            underline: Container(
                              height: 1,
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                  width: 1,
                                  color: context.colorScheme.onSurface
                                      .withOpacity(.1),
                                ),
                                top: BorderSide(
                                    width: 1,
                                    color: context.colorScheme.onSurface
                                        .withOpacity(.1)),
                                left: BorderSide(
                                    width: 1,
                                    color: context.colorScheme.onSurface
                                        .withOpacity(.1)),
                                right: BorderSide(
                                    width: 1,
                                    color: context.colorScheme.onSurface
                                        .withOpacity(.1)),
                              )),
                            ),
                            hint: const Bodymedium(data: 'Malzeme Seç'),
                            buttonPadding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            buttonDecoration: BoxDecoration(
                                border: null,
                                borderRadius: BorderRadius.circular(4)),
                            buttonWidth: context.dynamicWidth(1),
                            items: [...names]
                                .map((value) => DropdownMenuItem(
                                      value: value.name,
                                      child: Row(
                                        children: [
                                          Bodylarge(data: value.name),
                                          Bodysmall(
                                              data: " (${value.item.birim}) "),
                                        ],
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                currentValue = value!;
                              });
                            },
                          ),
                        ),
                  doneList.isEmpty
                      ? const SizedBox()
                      : Container(
                          color: context.colorScheme.onSurface.withOpacity(.03),
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              const Bodymedium(data: 'Sayılanlar'),
                              const SizedBox(
                                height: 10,
                              ),
                              ListView.separated(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  context.colorScheme.primary),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Bodymedium(
                                            data:
                                                '${doneList[index].name} ${doneList[index].quantity.toInt()} ${doneList[index].item.birim!}')
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      color: context.colorScheme.onSurface
                                          .withOpacity(.1),
                                      height: .8,
                                    );
                                  },
                                  itemCount: doneList.length),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                  sentList.isEmpty
                      ? const SizedBox()
                      : Container(
                          color: context.colorScheme.onSurface.withOpacity(.03),
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Bodymedium(
                                data: 'Kaydedilenler',
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        const Icon(FontAwesomeIcons.check,
                                            color: Colors.green),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Bodymedium(
                                            data:
                                                '${sentList[index].name} ${sentList[index].quantity.toInt()} ${sentList[index].item.birim!}'),
                                        const Spacer(),
                                        TextButton(
                                          onPressed: () {
                                            context.router.push(
                                                CheckDetailRoute(
                                                    check: getIt
                                                        .get<CheckMobx>()
                                                        .checks
                                                        .where((element) =>
                                                            element.malzeme ==
                                                            checkDetail[index]
                                                                .malzeme)
                                                        .first,
                                                    customer: getIt
                                                        .get<CustomerMobx>()
                                                        .customers
                                                        .where((element) =>
                                                            element.oid ==
                                                            checkDetail[index]
                                                                .musteriID)
                                                        .first,
                                                    item: getIt
                                                        .get<ItemsMobx>()
                                                        .items
                                                        .where((element) =>
                                                            element.oid ==
                                                            checkDetail[index]
                                                                .malzeme)
                                                        .first,
                                                    checkDetail:
                                                        checkDetail[index]));
                                          },
                                          child: const Bodymedium(
                                            data: "Detay",
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  itemCount: sentList.length)
                            ],
                          ),
                        )
                ],
              ),
            ),
    );
  }
}
