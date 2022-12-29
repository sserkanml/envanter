import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/bodylarge.dart';
import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/headline6.dart';
import '../../../models/customer_model.dart';
import '../../../models/projets_model.dart';
import '../../customers/view/customer_detail_view.dart';

class ProjectsDetailView extends StatefulWidget {
  final ProjectsModel project;
  final CustomerModel? projectsId;
  const ProjectsDetailView(
      {Key? key, required this.project, required this.projectsId})
      : super(key: key);

  @override
  State<ProjectsDetailView> createState() => _ProjectsDetailViewState();
}

class _ProjectsDetailViewState extends State<ProjectsDetailView> {
  late TextEditingController projectName;
  late TextEditingController tags;
  late TextEditingController projectNote;

  @override
  void initState() {
    projectName = TextEditingController();
    tags = TextEditingController();
    projectNote = TextEditingController();
    projectName.text = widget.project.projeAdi ?? ' ';
    tags.text = widget.project.etiket ?? ' ';
    projectNote.text = widget.project.projeNot ?? ' ';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Proje Detayı'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                const Spacer(),
                widget.projectsId == null
                    ? GFButton(
                        onPressed: () {},
                        child: const Bodymedium(
                          data: 'Firma Ata',
                          color: Colors.white,
                        ),
                      )
                    : Bodymedium(
                        data: 'Firması:${widget.projectsId!.musteriFirmaAdi}')
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodymedium(data: 'Proje Adı :'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: projectName,
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
            const Bodymedium(data: 'Etiket : * :'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: tags,
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
            const Bodymedium(data: 'Proje Not : *'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: projectNote,
              maxLines: 4,
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
            const Bodymedium(data: 'Proje Resim : '),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.camera,
                      color: context.colorScheme.onSurface.withOpacity(.4),
                    ),
                  ),
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                const Spacer(),
                GFButton(
                  onPressed: () {},
                  color: GFColors.WARNING,
                  child: const Bodymedium(
                    data: 'Düzenle',
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Bodylarge(data: 'Müşteri Bilgileri'),
            const SizedBox(
              height: 30,
            ),
            widget.projectsId == null
                ? const Bodymedium(data: 'Müşteri Bulunamadı')
                : Column(
                    children: [
                      Divider(
                        height: 1,
                        color: context.colorScheme.onSurface.withOpacity(.1),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 0.0,
                        ),
                        trailing: GFButton(
                          onPressed: () {
                            context.router.navigatorKey.currentState!
                                .push(MaterialPageRoute(
                              builder: (context) {
                                return CustomerDetailView(
                                    customer: widget.projectsId!);
                              },
                            ));
                          },
                          color: GFColors.DANGER,
                          child: const Bodymedium(
                            data: 'Detay',
                            color: Colors.white,
                          ),
                        ),
                        title: Bodylarge(
                            data: widget.projectsId!.musteriFirmaAdi ?? ''),
                      ),
                    ],
                  )
          ],
        ),
      )),
    );
  }
}
