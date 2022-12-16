import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:aden_envanterus/core/route/router_generator.dart';
import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';

class CustomersView extends StatelessWidget {
  const CustomersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Müşteriler'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                 GFIconButton(
                  icon: const Icon(FontAwesomeIcons.locationArrow),
                  onPressed: () {
                    context.router.push(const DetectLocationRoute());
                  },
                ),
                   const SizedBox(width: 10),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Arama Yap',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 8.0,
                        )),
                  ),
                ),
                const SizedBox(width: 10),
                GFIconButton(
                  icon: const Icon(FontAwesomeIcons.pencil),
                  onPressed: () {
                    context.router.push(const CreateCustomersRoute());
                  },
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
