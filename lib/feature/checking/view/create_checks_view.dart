import 'package:aden_envanterus/core/route/router_generator.dart';
import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/core/service/shared_references.dart';
import 'package:aden_envanterus/core/util/extension.dart';
import 'package:aden_envanterus/core/widgets/bodylarge.dart';
import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:aden_envanterus/feature/checking/model/check_qr_model.dart';
import 'package:aden_envanterus/feature/checking/model/scanned_list.dart';
import 'package:aden_envanterus/feature/checking/model/take_picture_mobx.dart';
import 'package:aden_envanterus/models/checks_service.dart';
import 'package:aden_envanterus/models/items_model.dart';
import 'package:aden_envanterus/models/items_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kartal/kartal.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../core/widgets/bodymedium.dart';
import '../../../models/customer_model.dart';
import 'package:flutter/material.dart';

class CreateChecksView extends StatefulWidget {
  final CustomerModel customer;
  const CreateChecksView({Key? key, required this.customer}) : super(key: key);

  @override
  State<CreateChecksView> createState() => _CreateChecksViewState();
}

class _CreateChecksViewState extends State<CreateChecksView> {
  late List<ItemsModel> items;
  List<NewCheckedList> fromWeb = [];
  List<NewCheckedList> fromCache = [];
  List<ItemsModel> sendList = [];
  bool isCompletedPhoto = false;
  bool isCompleted = false;
  @override
  void initState() {
    items = getIt
        .get<ItemsMobx>()
        .items
        .where((element) => element.musteriID == widget.customer.oid)
        .toList();
    for (var item in items) {
      for (var check in getIt.get<CheckMobx>().checks) {
        if (check.malzeme == item.oid) {
          fromWeb.add(NewCheckedList(
              name: item.adi!,
              quantity: check.miktar!,
              itemId: item.oid!,
              customerId: widget.customer.oid!,
              unit: item.birim!,
              item: item));
        } else {
          continue;
        }
      }
    }
    if (fromWeb.isEmpty) {
      for (var element in items) {
        sendList.add(element);
      }
    } else {
      for (var item in items) {
        if (fromWeb.any((element) => element.itemId == item.oid!)) {
          continue;
        } else {
          sendList.add(item);
        }
      }
    }

   
    if (getIt.get<Shared>().getGetStringsList('getSavedList') == null) {
      fromCache = [];
    } else {
      fromCache = getIt
          .get<Shared>()
          .getGetStringsList('getSavedList')!
          .map<NewCheckedList>((e) => NewCheckedList.fromJson(e))
          .toList()
          .where((element) => element.customerId == widget.customer.oid)
          .toList();
    }

    super.initState();
  }

  @override
  void dispose() {
    getIt.get<TakePicture>().refreshState();
    getIt.get<ScannedListMobx>().clearList();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var column = Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            checkbox(),
            Row(
              children: [
                Visibility(
                  visible: items.isNotEmpty && sendList.isNotEmpty,
                  child: SizedBox(
                    height: 40,
                    child: GFButton(
                      onPressed: ((getIt
                                      .get<ScannedListMobx>()
                                      .scannedList
                                      .isNotEmpty ||
                                  fromCache.isNotEmpty) &&
                              isCompleted)
                          ? () async {
                              if (fromCache.isEmpty) {
                                getIt
                                    .get<ScannedListMobx>()
                                    .scannedList
                                    .forEach((element) {
                                  getIt.get<CheckMobx>().createCheck(
                                      item_id: element.itemId,
                                      quantity: element.quantity.toString(),
                                      customer_id: element.customerId);
                                });
                              } else {
                                List<NewCheckedList> newCache = [];
                                for (var cache in fromCache) {
                                  for (var scanned in getIt
                                      .get<ScannedListMobx>()
                                      .scannedList) {
                                    if (scanned.itemId == cache.itemId) {
                                      cache.quantity =
                                          cache.quantity + scanned.quantity;
                                    } else {
                                      newCache.add(scanned);
                                    }
                                  }
                                }
                                // ignore: avoid_function_literals_in_foreach_calls
                                fromCache.forEach((element) async {
                                  await getIt.get<CheckMobx>().createCheck(
                                      item_id: element.itemId,
                                      quantity:
                                          element.quantity.toInt().toString(),
                                      customer_id: element.customerId);
                                });

                                getIt.get<Shared>().getCacheList.removeWhere(
                                    (element) =>
                                        NewCheckedList.fromJson(element)
                                            .customerId ==
                                        widget.customer.oid);
                                getIt
                                    .get<Shared>()
                                    .getSetStringList('getSavedList');
                                MotionToast.success(
                                    description: const Bodymedium(
                                  data: 'İşlem başarıyla kaydedildi',
                                )).show(context);
                                await Future.delayed(
                                    const Duration(milliseconds: 1000), () {
                                  context.router.popUntil((route) =>
                                      route.settings.name == ChecksRoute.name);
                                });
                              }
                            }
                          : getIt.get<ScannedListMobx>().scannedList.isEmpty
                              ? null
                              : () {
                                  List<NewCheckedList> listScanned = getIt
                                      .get<ScannedListMobx>()
                                      .scannedList
                                      .toList();
                                  if (fromCache.isEmpty) {
                                    for (var scanned in listScanned) {
                                      fromCache.add(scanned);
                                      getIt
                                          .get<Shared>()
                                          .getCacheList
                                          .add(scanned.toJsonBase());
                                    }
                                    getIt.get<ScannedListMobx>().clearList();
                                    getIt
                                        .get<Shared>()
                                        .getSetStringList('getSavedList');
                                    setState(() {});
                                  } else {
                                    List<NewCheckedList> notContain = [];
                                    for (var element in listScanned) {
                                      for (var cache in fromCache) {
                                        if (cache.itemId == element.itemId) {
                                          cache.quantity =
                                              cache.quantity + element.quantity;
                                        } else {
                                          notContain.add(element);
                                        }
                                      }
                                    }
                                    fromCache.addAll(notContain);
                                    getIt
                                        .get<Shared>()
                                        .getCacheList
                                        .removeWhere((element) =>
                                            NewCheckedList.fromJson(element)
                                                .customerId ==
                                            widget.customer.oid);
                                  }
                                  for (var element in fromCache) {
                                    getIt
                                        .get<Shared>()
                                        .getCacheList
                                        .add(element.toJsonBase());
                                  }
                                  MotionToast.success(
                                      description: const Bodymedium(
                                    data: 'İşlem Başarılı Tamamlandı...',
                                  )).show(context);

                                  getIt.get<ScannedListMobx>().clearList();
                                  setState(() {});
                                  getIt
                                      .get<Shared>()
                                      .getSetStringList('getSavedList');
                                },
                      child:
                          Bodymedium(data: isCompleted ? ' Tamamla' : 'Kaydet'),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 40,
                  child: GFIconButton(
                    icon: Icon(
                      isCompletedPhoto
                          ? FontAwesomeIcons.check
                          : FontAwesomeIcons.camera,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () async {
                      if (isCompletedPhoto) {
                        bool? data = await context.router
                            .push<bool>(const ShowCheckedImageRoute());
                        setState(() {
                          isCompletedPhoto = data ?? false;
                        });
                      } else {
                        bool? data = await context.router.push<bool>(
                            TakePictureForChecksRoute(
                                customer: widget.customer));
                        setState(() {
                          isCompletedPhoto = data ?? false;
                        });
                      }
                    },
                  ),
                )
              ],
            )
          ],
        ),
        getIt.get<ScannedListMobx>().scannedList.isEmpty
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Bodymedium(
                    data: 'Taranan Sayımlar',
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                context.getPath(
                                    folder: 'svg', file: 'qr_code.svg'),
                                width: 20,
                                height: 20,
                                color: Colors.pink,
                              ),
                              const SizedBox(width: 10),
                              Bodymedium(
                                  data:
                                      '${getIt.get<ScannedListMobx>().scannedList[index].name}:'),
                              const SizedBox(width: 10),
                              Bodymedium(
                                  data: getIt
                                      .get<ScannedListMobx>()
                                      .scannedList[index]
                                      .quantity
                                      .toInt()
                                      .toString()),
                              const SizedBox(width: 10),
                              Bodymedium(
                                  data: getIt
                                      .get<ScannedListMobx>()
                                      .scannedList[index]
                                      .unit),
                            ],
                          ));
                    },
                    itemCount: getIt.get<ScannedListMobx>().scannedList.length,
                  ),
                ],
              ),
        const SizedBox(
          height: 10,
        ),
        fromWeb.isEmpty
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Bodymedium(
                    data: 'Tamamlanan Sayımlar',
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              const Icon(FontAwesomeIcons.check,
                                  color: Colors.green),
                              const SizedBox(width: 10),
                              Bodymedium(data: '${fromWeb[index].name}:'),
                              const SizedBox(width: 10),
                              Bodymedium(
                                  data: fromWeb[index]
                                      .quantity
                                      .toInt()
                                      .toString()),
                              const SizedBox(width: 10),
                              Bodymedium(data: fromWeb[index].unit),
                            ],
                          ));
                    },
                    itemCount: fromWeb.length,
                  ),
                ],
              ),
        const SizedBox(height: 10),
        const SizedBox(
          height: 10,
        ),
        fromCache.isEmpty
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Bodymedium(
                    data: 'Kaydedilen Sayımlar',
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              const Icon(FontAwesomeIcons.floppyDisk,
                                  color: Colors.blue),
                              const SizedBox(width: 10),
                              Bodymedium(data: '${fromCache[index].name}:'),
                              const SizedBox(width: 10),
                              Bodymedium(
                                  data: fromCache[index]
                                      .quantity
                                      .toInt()
                                      .toString()),
                              const SizedBox(width: 10),
                              Bodymedium(data: fromCache[index].unit),
                            ],
                          ));
                    },
                    itemCount: fromCache.length,
                  ),
                ],
              ),
      ],
    );
    return Scaffold(
        floatingActionButton: Visibility(
          visible: items.isNotEmpty && sendList.isNotEmpty,
          child: FloatingActionButton(
              onPressed: () async {
                await context.router.push(ScanQrCodeRoute(
                    customer: widget.customer, items: sendList));
                setState(() {});
              },
              child: SvgPicture.asset(
                context.getPath(folder: 'svg', file: 'qr_code.svg'),
                color: Colors.white,
                width: 35,
                height: 35,
              )),
        ),
        appBar: AppBar(
          actions: [
            Visibility(
              visible: items.isNotEmpty,
              child: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    useRootNavigator: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    builder: (context) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: context.dynamicHeight(.4)),
                        child: ListView.builder(
                          shrinkWrap: true,
                          primary: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Bodylarge(data: items[index].adi ?? ''),
                              trailing:
                                  Bodymedium(data: items[index].birim ?? ' '),
                            );
                          },
                          itemCount: items.length,
                        ),
                      );
                    },
                  );
                },
                child: const Bodymedium(
                  data: "Malzemeler",
                ),
              ),
            ),
          ],
          title: const Headline6(data: 'Sayım Oluştur'),
        ),
        body: items.isEmpty
            ? SizedBox(
                width: context.dynamicWidth(1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      context.getPath(file: 'notFound.svg', folder: 'svg'),
                      width: 300,
                      height: 300,
                      color: context.colorScheme.onSurface.withOpacity(.4),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Bodymedium(data: 'Herhangi bir malzeme bulunamadı')
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: column,
              ));
  }

  Visibility checkbox() {
    return Visibility(
      visible: items.isNotEmpty && sendList.isNotEmpty,
      child: Row(
        children: [
          const Bodymedium(data: 'Tamamla'),
          Checkbox(
            tristate:
                getIt.get<ScannedListMobx>().scannedList.isEmpty ? true : false,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: isCompleted,
            onChanged: (value) {
              setState(() {
                isCompleted = !isCompleted;
              });
            },
          )
        ],
      ),
    );
  }
}
