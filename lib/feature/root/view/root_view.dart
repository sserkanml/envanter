import 'package:aden_envanterus/core/route/router_generator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        DashboardWrapperRoute(),
        ProjectsWrapperRoute(),
        CustomersWrapperRoute(),
        ChecksWrapperRoute(),
        SettingsWrapperRoute()
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          onTap: (value) {
            tabsRouter.setActiveIndex(value);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'Dashboard'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.barsProgress), label: 'Projeler'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.users), label: 'Müşteriler'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.images), label: 'Sayımlar'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.bars), label: 'Ayarlar'),
          ],
          currentIndex: tabsRouter.activeIndex,
        );
      },
      builder: (context, child, animation) {
        return child;
      },
    );
  }
}
