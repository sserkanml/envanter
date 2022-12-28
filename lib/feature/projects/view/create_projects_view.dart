import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kartal/kartal.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../../../core/service/dependecy_service.dart';
import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/bodysmall.dart';
import '../../../core/widgets/headline6.dart';
import '../../../models/member_service.dart';
import '../../../models/projects_service.dart';
import '../view_model/camera_managment.dart';
import '../view_model/project_form.dart';

class CreateProjectsView extends StatefulWidget {
  const CreateProjectsView({Key? key}) : super(key: key);

  @override
  State<CreateProjectsView> createState() => _CreateProjectsViewState();
}

class _CreateProjectsViewState extends State<CreateProjectsView> {
  late String dropdownValue;
  String projectName = '';
  String tag = '';
  String note = '';
  String projectUserId = '';
  String selectedText = 'Seçilen Resim';
  bool isLoading = false;
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
              key: ProjectForm.projectForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Bodysmall(data: 'Proje Adı'),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onSaved: (newValue) {
                      projectName = newValue!;
                    },
                    validator: Validators.required('Bu alan boş geçilemez'),
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
                            color:
                                context.colorScheme.onSurface.withOpacity(.5),
                            width: .3),
                        dropdownButtonColor: Colors.transparent,
                        value: dropdownValue,
                        onChanged: (dynamic newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                            projectUserId = getIt
                                    .get<MemberMobx>()
                                    .members
                                    .where((element) =>
                                        element.kullaniciAdi == dropdownValue)
                                    .first
                                    .oid ??
                                ' ';
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
                    onSaved: (newValue) {
                      tag = newValue!;
                    },
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
                    onSaved: (newValue) {
                      note = newValue!;
                    },
                    maxLines: 6,
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
                  Row(
                    children: [
                      const Spacer(),
                      GFButton(
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          if (ProjectForm.projectForm.currentState!
                              .validate()) {
                            ProjectForm.projectForm.currentState!.save();
                            isLoading = true;
                            setState(() {});
                            await getIt.get<ProjectsMobx>().postProject(
                                projectName: projectName,
                                note: note,
                                tag: tag,
                                projectUserId: projectUserId);
                            isLoading = false;
                            setState(() {});
                            // ignore: use_build_context_synchronously
                            MotionToast.success(
                              onClose: () {
                                Future.delayed(
                                    const Duration(milliseconds: 1000), () {
                                  context.router.pop();
                                });
                              },
                              description: const Bodymedium(
                                data:
                                    'Proje oluşturma işlemi başarıla tamamlandı',
                              ),
                              title: Bodymedium(
                                  fontWeight: FontWeight.bold,
                                  data: getIt.get<ProjectsMobx>().infoMessage),
                            ).show(context);
                          } else {}
                        },
                        child: isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : const Bodymedium(
                                data: 'Kaydet',
                                color: Colors.white,
                              ),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
