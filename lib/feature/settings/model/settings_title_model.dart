import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/route/router_generator.dart';

class SettingsTitleModel {
  final String name;
  final PageRouteInfo<dynamic> page;
  final IconData icon;

  SettingsTitleModel(
      {required this.icon, required this.name, required this.page});
}

List<SettingsTitleModel> settingtitle = [
  // SettingsTitleModel(
  //     name: 'Bilgilerim',
  //     page: const MyProfileRoute(),
  //     icon: FontAwesomeIcons.user),
  //  SettingsTitleModel(
  // name: 'Uyarılar',
  // page: const MyProfileRoute(),
  // icon: Icons.dangerous),
  SettingsTitleModel(
      name: 'Kullanıcılar',
      page: const UsersRoute(),
      icon: FontAwesomeIcons.users),
  // SettingsTitleModel(
  //   icon: FontAwesomeIcons.pencil,
  //   name: 'Kullanıcı Oluşturma',
  //   page: const CreateUserRoute(),
  // ),
  // SettingsTitleModel(
  //     icon: FontAwesomeIcons.gears,
  //     name: 'Sistem Ayarları',
  //     page: const SystemSettingsRoute()),
  SettingsTitleModel(
      icon: FontAwesomeIcons.rightFromBracket,
      name: 'Çıkış Yap',
      page: const UsersRoute()),
];
