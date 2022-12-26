import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/core/widgets/bodylarge.dart';
import 'package:aden_envanterus/core/widgets/bodymedium.dart';
import 'package:aden_envanterus/feature/checking/model/check_qr_model.dart';
import 'package:aden_envanterus/feature/checking/view_model/check_form.dart';
import 'package:aden_envanterus/models/checks_service.dart';
import 'package:aden_envanterus/models/items_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:kartal/kartal.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../core/route/router_generator.dart';
import '../../../core/util/extension.dart';
import '../../../core/widgets/headline6.dart';
import '../../../models/customer_model.dart';

class CreateChecksView extends StatefulWidget {
  final CustomerModel customer;
  const CreateChecksView({Key? key, required this.customer}) : super(key: key);

  @override
  State<CreateChecksView> createState() => _CreateChecksViewState();
}

class _CreateChecksViewState extends State<CreateChecksView> {
  late List<CheckQrModel> itemsQr;
  List<String> names = [];
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
          names.add(element.name);
          element.controller.text = element.quantity.toString();
        }
        element.controller.text = element.quantity.toString();
      }
      if (names.isNotEmpty) {
        currentValue = names[0];
      }
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
                    .text = data.toString();

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
      ),
      body: itemsQr.isEmpty
          ? const Center(
              child: Bodylarge(data: 'Malzeme bulunamadı...'),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: CheckForm.checkForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Bodylarge(data: 'Sayım Başlat'),
                    const SizedBox(
                      height: 20,
                    ),
                    names.isEmpty
                        ? const SizedBox()
                        : DropdownButton2<String>(
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
                                      value: value,
                                      child: Text(value),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                currentValue = value!;
                              });
                            },
                          ),
                    const SizedBox(height: 20),
                    ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Bodymedium(data: itemsQr[index].name),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: itemsQr[index].controller,
                              readOnly: true,
                              onSaved: (newValue) {},
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  suffixIcon: names.any(
                                    (element) {
                                      return element == itemsQr[index].name;
                                    },
                                  )
                                      ? null
                                      : TextButton(
                                          onPressed: () {},
                                          child: const Bodymedium(
                                            data: "Detay",
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 8.0,
                                  )),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 20);
                      },
                      itemCount: itemsQr.length,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Spacer(),
                       names.isEmpty ? SizedBox() : GFButton(
                          onPressed: itemsQr.every(
                            (element) {
                              return element.quantity > 0;
                            },
                          )
                              ? () async {
                                  CheckForm.checkForm.currentState!.save();
                                  for (var i = 0; i < itemsQr.length; i++) {
                                    // ignore: avoid_function_literals_in_foreach_calls
                                    names.forEach((element) async {
                                      if (element == itemsQr[i].name) {
                                        await getIt
                                            .get<CheckMobx>()
                                            .createCheck(
                                                item_id: itemsQr[i].item.oid!,
                                                customer_id:
                                                    itemsQr[i].item.musteriID!,
                                                quantity: itemsQr[i]
                                                    .quantity
                                                    .toInt()
                                                    .toString());
                                      } else {}
                                    });
                                  }

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
                                }
                              : null,
                          child: const Bodymedium(
                            data: 'Kaydet',
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
