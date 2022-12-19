import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/core/widgets/bodylarge.dart';
import 'package:aden_envanterus/core/widgets/bodymedium.dart';
import 'package:aden_envanterus/core/widgets/bodysmall.dart';
import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:aden_envanterus/feature/projects/view_model/camera_managment.dart';
import 'package:aden_envanterus/feature/projects/widgets/custom_camera_picker.dart';
import 'package:aden_envanterus/models/member_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kartal/kartal.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class CreateProjectsView extends StatefulWidget {
  const CreateProjectsView({Key? key}) : super(key: key);

  @override
  State<CreateProjectsView> createState() => _CreateProjectsViewState();
}

class _CreateProjectsViewState extends State<CreateProjectsView> {
  late String dropdownValue;
  String selectedText = 'Seçilen Resim';
  @override
  void initState() {
    dropdownValue = getIt.get<MemberMobx>().members[0].kullaniciAdi ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: const Headline6(data: 'Yeni Proje'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Bodysmall(data: 'Proje Adı'),
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
                height: 10,
              ),
              const Bodysmall(data: 'Atanan Kullanıcı'),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: DropdownButtonHideUnderline(
                  child: GFDropdown(
                    padding: const EdgeInsets.all(15),
                    borderRadius: BorderRadius.circular(5),
                    border: BorderSide(
                        color: context.colorScheme.onSurface.withOpacity(.5),
                        width: .3),
                    dropdownButtonColor: Colors.transparent,
                    value: dropdownValue,
                    onChanged: (dynamic newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: [
                      ...List.generate(
                        getIt.get<MemberMobx>().members.length,
                        (index) {
                          return getIt
                              .get<MemberMobx>()
                              .members[index]
                              .kullaniciAdi;
                        },
                      )
                    ]
                        .map((value) => DropdownMenuItem(
                              value: value,
                              child: Text(value ?? ''),
                            ))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Bodysmall(data: 'Etiketler'),
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
                height: 10,
              ),
              const Bodysmall(data: 'Notlar'),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 6,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GFButton(
                    onPressed: () async {
                      if (CameraManagmentService.assetsEntities.isNullOrEmpty) {
                        await CameraManagmentService.getPermission(
                            callback: (() {
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Bodymedium(
                                                    data:
                                                        '$selectedText:${CameraManagmentService.selectedEntities.length}'),
                                                IconButton(
                                                  onPressed: () {
                                                    for (var element
                                                        in CameraManagmentService
                                                            .selectedEntitiesCopy) {
                                                      element.isSelecting =
                                                          false;
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
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 5,
                                            mainAxisSpacing: 5,
                                            mainAxisExtent: 200,
                                          ),
                                          itemCount: CameraManagmentService
                                              .assetsEntities.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                                onTap: () {
                                                  if (CameraManagmentService
                                                          .selectedEntities
                                                          .length ==
                                                      1) {
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
                                                                .dynamicHeight(
                                                                    1),
                                                            width: context
                                                                .dynamicWidth(
                                                                    1),
                                                            color: context
                                                                .colorScheme
                                                                .onSurface
                                                                .withOpacity(
                                                                    .4),
                                                            child: const Center(
                                                              child: Icon(
                                                                Icons
                                                                    .check_rounded,
                                                                color: Colors
                                                                    .amber,
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
                                                    pickerConfig:
                                                        CameraPickerConfig(
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
                  GFButton(
                    onPressed: () {},
                    child: const Bodymedium(
                      data: 'Kaydet',
                      color: Colors.white,
                    ),
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
                            CameraManagmentService
                                .selectedEntities[index].entity,
                            fit: BoxFit.cover,
                          );
                        },
                        itemCount:
                            CameraManagmentService.selectedEntities.length,
                      ),
                    )
            ],
          ),
        ),
      )),
    );
  }
}
