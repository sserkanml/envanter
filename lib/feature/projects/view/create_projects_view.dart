import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/core/widgets/bodylarge.dart';
import 'package:aden_envanterus/core/widgets/bodymedium.dart';
import 'package:aden_envanterus/core/widgets/bodysmall.dart';
import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:aden_envanterus/feature/projects/view_model/camera_managment.dart';
import 'package:aden_envanterus/models/member_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
                      showDialog(
                        context: context,
                        builder: (context) {
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
                                                    'Seçilen Resimler :${CameraManagmentService.selectedEntitiesCopy.length}'),
                                            IconButton(
                                              onPressed: () {
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
                                  child: AnimationLimiter(
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      primary: false,
                                      padding: const EdgeInsets.only(top: 20),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        mainAxisExtent: 200,
                                      ),
                                      itemCount: CameraManagmentService
                                          .assetsEntities.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return AnimationConfiguration.staggeredGrid(
                                            position: index,
                                            columnCount: 4,
                                            child: ScaleAnimation(
                                                child: FadeInAnimation(
                                                    child: AssetEntityImage(
                                                        CameraManagmentService
                                                                .assetsEntities[
                                                            index]))));
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
                                                onPressed: () {},
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
                                            onPressed: () {},
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
            ],
          ),
        ),
      )),
    );
  }
}
