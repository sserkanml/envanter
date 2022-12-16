import 'package:aden_envanterus/core/widgets/bodymedium.dart';
import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_toggle_type.dart';

class SystemSettingsView extends StatefulWidget {
  const SystemSettingsView({Key? key}) : super(key: key);

  @override
  State<SystemSettingsView> createState() => _SystemSettingsViewState();
}

class _SystemSettingsViewState extends State<SystemSettingsView> {
  bool autoQr = false;
  bool autoBar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Sistem Ayarları'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Bodymedium(data: 'Otomatik Qr Code Oluştur'),
              trailing: GFToggle(
                onChanged: (val) {
                  autoQr = !autoQr;
                },
                value: autoQr,
                type: GFToggleType.ios,
              ),
            ),
            ListTile(
              title: const Bodymedium(data: 'Otomatik Bar Code Oluştur'),
              trailing: GFToggle(
                onChanged: (val) {
                  setState(() {
                    autoBar = !autoBar;
                  });
                },
                value: autoBar,
                type: GFToggleType.ios,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
