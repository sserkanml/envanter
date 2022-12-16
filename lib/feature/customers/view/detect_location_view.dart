import 'package:aden_envanterus/core/widgets/bodymedium.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/headline6.dart';

class DetectLocationView extends StatefulWidget {
  const DetectLocationView({Key? key}) : super(key: key);

  @override
  State<DetectLocationView> createState() => _DetectLocationViewState();
}

class _DetectLocationViewState extends State<DetectLocationView> {
  late String dropdownValue;
  @override
  void initState() {
    dropdownValue = 'Kayıtlı Konumlar';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Lokasyon Tanımla'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AnimationLimiter(
              child: GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.only(top: 20),
                crossAxisCount: 2,
                children: [
                  AnimationConfiguration.staggeredGrid(
                      position: 0,
                      columnCount: 2,
                      child: ScaleAnimation(
                          child: FadeInAnimation(
                              child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Spacer(),
                            const Bodymedium(data: 'Kayıtlı Konumlar'),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: DropdownButtonHideUnderline(
                                  child: GFDropdown(
                                    padding: const EdgeInsets.all(15),
                                    borderRadius: BorderRadius.circular(5),
                                    border: BorderSide(
                                        color: context.colorScheme.onSurface
                                            .withOpacity(.5),
                                        width: .3),
                                    dropdownButtonColor: Colors.transparent,
                                    value: dropdownValue,
                                    onChanged: (dynamic newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                    items: ['Kayıtlı Konumlar']
                                        .map((value) => DropdownMenuItem(
                                              value: value,
                                              child: Text(value),
                                            ))
                                        .toList(),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            GFButton(
                              onPressed: () {},
                              child: const Bodymedium(
                                data: 'Devam Et',
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      )))),
                  AnimationConfiguration.staggeredGrid(
                      position: 0,
                      columnCount: 2,
                      child: ScaleAnimation(
                          child: FadeInAnimation(
                              child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Spacer(),
                            const Bodymedium(data: 'Özel Seç'),
                            const Spacer(),
                            const Icon(
                              FontAwesomeIcons.locationArrow,
                              color: Colors.orange,
                              size: 70,
                            ),
                            const Spacer(),
                            GFButton(
                              onPressed: () {},
                              child: const Bodymedium(
                                data: 'Seç',
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      )))),
                  AnimationConfiguration.staggeredGrid(
                      position: 0,
                      columnCount: 2,
                      child: ScaleAnimation(
                          child: FadeInAnimation(
                              child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Spacer(),
                            const Bodymedium(data: 'Konuma Göre Belirle'),
                            const Spacer(),
                            const Icon(
                              FontAwesomeIcons.locationArrow,
                              color: Colors.orange,
                              size: 70,
                            ),
                            const Spacer(),
                            GFButton(
                              onPressed: () {},
                              child: const Bodymedium(
                                data: 'Seç',
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ))))
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
