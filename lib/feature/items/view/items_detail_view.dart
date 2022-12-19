import 'package:aden_envanterus/core/util/extension.dart';
import 'package:aden_envanterus/core/widgets/bodylarge.dart';
import 'package:aden_envanterus/core/widgets/bodymedium.dart';
import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:aden_envanterus/models/customer_model.dart';
import 'package:aden_envanterus/models/items_model.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kartal/kartal.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

import '../../projects/view_model/camera_managment.dart';
import '../../projects/widgets/custom_camera_picker.dart';

class ItemsDetailView extends StatefulWidget {
  final ItemsModel item;
  final CustomerModel customer;
  const ItemsDetailView({Key? key, required this.item, required this.customer})
      : super(key: key);

  @override
  State<ItemsDetailView> createState() => _ItemsDetailViewState();
}

class _ItemsDetailViewState extends State<ItemsDetailView> {
  late TextEditingController itemName;
  late TextEditingController unit;
  late TextEditingController modelYear;
  late TextEditingController exchange;
  late TextEditingController serialNumber;
  late TextEditingController size;
  late TextEditingController brand;
  late TextEditingController model;
  late TextEditingController deadline;
  late TextEditingController startdate;
  late DateTime? deadlineTime;
  late DateTime? startingTime;
  String selectedText = 'Seçilen Resim';
  @override
  void initState() {
    itemName = TextEditingController();
    unit = TextEditingController();
    modelYear = TextEditingController();
    exchange = TextEditingController();
    size = TextEditingController();
    brand = TextEditingController();
    model = TextEditingController();
    deadline = TextEditingController();
    startdate = TextEditingController();
    startingTime = DateTime.now();
    deadlineTime = DateTime.now();
    deadline.text =
        ('${deadlineTime!.day < 10 ? '0${deadlineTime!.day}' : deadlineTime!.day.toString()}/${deadlineTime!.month < 10 ? '0${deadlineTime!.month}' : deadlineTime!.month.toString()}/${deadlineTime!.year}')
            .toString();

    startdate.text =
        ('${startingTime!.day < 10 ? '0${startingTime!.day}' : startingTime!.day.toString()}/${startingTime!.month < 10 ? '0${startingTime!.month}' : startingTime!.month.toString()}/${startingTime!.year}')
            .toString();

    unit.text = widget.item.birim ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Malzeme Detayı'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            for (var element in CameraManagmentService.selectedEntitiesCopy) {
              element.isSelecting = false;
            }
            CameraManagmentService.selectedEntities.clear();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Bodymedium(data: '${widget.item.adi} --'),
                const SizedBox(width: 10),
                Bodymedium(
                  data: widget.customer.musteriFirmaAdi ?? ' ',
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                Bodymedium(
                  data: 'Barkod:${widget.item.barkod}',
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Birim :'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: unit,
              readOnly: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Satın Alma Fiyati:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Satın Alma Döviz Cinsi:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Ebat:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Seri Numarası:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Markası:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Modeli:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Model Yılı:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onTap: () {},
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Satın Alma Tarihi:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              readOnly: true,
              controller: startdate,
              onTap: () async {
                final startTime = await showCalendarDatePicker2Dialog(
                    initialValue: [startingTime],
                    context: context,
                    config: CalendarDatePicker2WithActionButtonsConfig(
                        weekdayLabels: [
                          'Pz',
                          'Pzt',
                          'Sal',
                          'Çar',
                          'Per',
                          'Cum',
                          'Cmt'
                        ],
                        calendarType: CalendarDatePicker2Type.single,
                        cancelButton: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            width: 90,
                            height: 40,
                            color: Colors.red,
                            child: const Center(
                              child: Bodylarge(
                                data: 'İptal Et',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        okButton: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            width: 90,
                            height: 40,
                            color: Colors.green,
                            child: const Center(
                              child: Bodylarge(
                                data: 'Onayla',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )),
                    dialogSize: const Size(300, 470));

                if (startTime == null) {
                  return;
                } else {
                  setState(() {
                    startingTime = startTime[0];
                    startdate.text =
                        ('${startingTime!.day < 10 ? '0${startingTime!.day}' : startingTime!.day.toString()}/${startingTime!.month < 10 ? '0${startingTime!.month}' : startingTime!.month.toString()}/${startingTime!.year}');
                  });
                }
              },
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    FontAwesomeIcons.calendar,
                    color: context.colorScheme.onSurface,
                  ),
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Son Kullanma Tarihi:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              readOnly: true,
              onTap: () async {
                final endTime = await showCalendarDatePicker2Dialog(
                    initialValue: [deadlineTime],
                    context: context,
                    config: CalendarDatePicker2WithActionButtonsConfig(
                        weekdayLabels: [
                          'Pz',
                          'Pzt',
                          'Sal',
                          'Çar',
                          'Per',
                          'Cum',
                          'Cmt'
                        ],
                        calendarType: CalendarDatePicker2Type.single,
                        cancelButton: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            width: 90,
                            height: 40,
                            color: Colors.red,
                            child: const Center(
                              child: Bodylarge(
                                data: 'İptal Et',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        okButton: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            width: 90,
                            height: 40,
                            color: Colors.green,
                            child: const Center(
                              child: Bodylarge(
                                data: 'Onayla',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )),
                    dialogSize: const Size(300, 470));

                if (endTime == null) {
                  return;
                } else {
                  setState(() {
                    deadlineTime = endTime[0];
                    deadline.text =
                        ('${deadlineTime!.day < 10 ? '0${deadlineTime!.day}' : deadlineTime!.day.toString()}/${deadlineTime!.month < 10 ? '0${deadlineTime!.month}' : deadlineTime!.month.toString()}/${deadlineTime!.year}');
                  });
                }
              },
              controller: deadline,
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    FontAwesomeIcons.calendar,
                    color: context.colorScheme.onSurface,
                  ),
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Qr Oluştur:'),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: GFButton(
                fullWidthButton: true,
                onPressed: () {},
                type: GFButtonType.outline2x,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      context.getPath(folder: 'svg', file: 'qr_code.svg'),
                      width: 25,
                      height: 25,
                      color: context.colorScheme.onSurface.withOpacity(.7),
                    ),
                    const SizedBox(width: 20),
                    const Bodylarge(
                      data: 'Qr Oluştur',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                GFButton(
                  onPressed: () async {
                    if (CameraManagmentService.assetsEntities.isNullOrEmpty) {
                      await CameraManagmentService.getPermission(callback: (() {
                        setState(() {});
                      }));
                    } else {}

                    await showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, customSetState) {
                            return Material(
                              child: Stack(
                                children: [
                                  Positioned(
                                      height: 50,
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 1,
                                                    color: context
                                                        .colorScheme.onSurface
                                                        .withOpacity(.1)))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Bodymedium(
                                                  data:
                                                      '$selectedText:${CameraManagmentService.selectedEntities.length}'),
                                              IconButton(
                                                onPressed: () {
                                                  for (var element
                                                      in CameraManagmentService
                                                          .selectedEntitiesCopy) {
                                                    element.isSelecting = false;
                                                  }
                                                  CameraManagmentService
                                                      .selectedEntities
                                                      .clear();
                                                  Navigator.pop(context);
                                                },
                                                icon: const Icon(Icons.close),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                  Positioned.fill(
                                    top: 50,
                                    bottom: 60,
                                    child: NotificationListener<
                                        ScrollNotification>(
                                      onNotification: (notification) {
                                        CameraManagmentService
                                            .handleScrollEvent(notification,
                                                () {
                                          setState(() {});
                                        });
                                        return true;
                                      },
                                      child: GridView.builder(
                                        shrinkWrap: true,
                                        primary: false,
                                        padding: const EdgeInsets.only(top: 20),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 5,
                                          mainAxisExtent: 200,
                                        ),
                                        itemCount: CameraManagmentService
                                            .assetsEntities.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                              onTap: () {
                                                if (CameraManagmentService
                                                        .selectedEntities
                                                        .length ==
                                                    4) {
                                                  if (CameraManagmentService
                                                      .selectedEntitiesCopy[
                                                          index]
                                                      .isSelecting) {
                                                    CameraManagmentService
                                                        .selectedEntitiesCopy[
                                                            index]
                                                        .isSelecting = false;
                                                    CameraManagmentService
                                                        .selectedEntities
                                                        .remove(CameraManagmentService
                                                                .selectedEntitiesCopy[
                                                            index]);
                                                    customSetState(
                                                      () {},
                                                    );
                                                  } else {
                                                    customSetState(
                                                      () {
                                                        selectedText =
                                                            'Maksimum Sayı';
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  if (CameraManagmentService
                                                      .selectedEntitiesCopy[
                                                          index]
                                                      .isSelecting) {
                                                    CameraManagmentService
                                                        .selectedEntitiesCopy[
                                                            index]
                                                        .isSelecting = false;
                                                    CameraManagmentService
                                                        .selectedEntities
                                                        .remove(CameraManagmentService
                                                                .selectedEntitiesCopy[
                                                            index]);
                                                  } else {
                                                    CameraManagmentService
                                                        .selectedEntitiesCopy[
                                                            index]
                                                        .isSelecting = true;
                                                    CameraManagmentService
                                                        .selectedEntities
                                                        .add(CameraManagmentService
                                                                .selectedEntitiesCopy[
                                                            index]);
                                                  }
                                                  customSetState(
                                                    () {
                                                      selectedText =
                                                          'Seçilen Resim';
                                                    },
                                                  );
                                                }
                                              },
                                              child: CameraManagmentService
                                                      .selectedEntitiesCopy[
                                                          index]
                                                      .isSelecting
                                                  ? Stack(
                                                      children: [
                                                        Positioned.fill(
                                                          child:
                                                              AssetEntityImage(
                                                            CameraManagmentService
                                                                    .assetsEntities[
                                                                index],
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Container(
                                                          height: context
                                                              .dynamicHeight(1),
                                                          width: context
                                                              .dynamicWidth(1),
                                                          color: context
                                                              .colorScheme
                                                              .onSurface
                                                              .withOpacity(.4),
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons
                                                                  .check_rounded,
                                                              color:
                                                                  Colors.amber,
                                                              size: 30,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  : AssetEntityImage(
                                                      CameraManagmentService
                                                              .assetsEntities[
                                                          index],
                                                      fit: BoxFit.cover,
                                                    ));
                                        },
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    height: 60,
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide(
                                                  width: 1,
                                                  color: context
                                                      .colorScheme.onSurface
                                                      .withOpacity(.1)))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                height: 70,
                                                child: GFButton(
                                                  color: GFColors.DANGER,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Bodymedium(
                                                    data: 'Seç',
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            GFIconButton(
                                              icon: const Icon(
                                                  FontAwesomeIcons.camera),
                                              onPressed: () async {
                                                final AssetEntity? entity =
                                                    await CameraPicker
                                                        .pickFromCamera(
                                                  context,
                                                  pickerConfig: CameraPickerConfig(
                                                      textDelegate:
                                                          CustomCameraPickerDelegate()),
                                                );
                                                if (entity == null) {
                                                } else {
                                                  CameraManagmentService
                                                      .assetsEntities
                                                      .add(entity);
                                                  CameraManagmentService
                                                      .selectedEntitiesCopy
                                                      .add(AssetEntityModel(
                                                          entity));
                                                  customSetState(
                                                    () {},
                                                  );
                                                }
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                    setState(() {});
                  },
                  child: Row(
                    children: const <Widget>[
                      Icon(
                        Icons.camera_enhance,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Bodylarge(
                        data: 'Fotoğraf Ekle',
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const Spacer(),
                GFButton(
                  onPressed: () {},
                  child: const Bodymedium(data: 'Düzenle', color: Colors.white),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CameraManagmentService.selectedEntities.isEmpty
                ? const SizedBox()
                : SizedBox(
                    height: 300,
                    child: PageView.builder(
                      itemBuilder: (context, index) {
                        return AssetEntityImage(
                          CameraManagmentService.selectedEntities[index].entity,
                          fit: BoxFit.cover,
                        );
                      },
                      itemCount: CameraManagmentService.selectedEntities.length,
                    ),
                  )
          ],
        ),
      )),
    );
  }
}
