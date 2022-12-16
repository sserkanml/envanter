import 'package:aden_envanterus/core/route/guard/login_guard.dart';
import 'package:aden_envanterus/core/route/root_router.dart';
import 'package:aden_envanterus/feature/authentication/view/login_view.dart';
import 'package:aden_envanterus/feature/authentication/view/sign_up_view.dart';
import 'package:aden_envanterus/feature/root/view/empty_view.dart';
import 'package:aden_envanterus/feature/start/view/on_board_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../feature/checking/view/checks_view.dart';
import '../../feature/checking/view/checks_wrapper_view.dart';
import '../../feature/checking/view/confirmed_view.dart';
import '../../feature/checking/view/create_checks_view.dart';
import '../../feature/checking/view/pending_checking_view.dart';
import '../../feature/customers/view/create_customers_view.dart';
import '../../feature/customers/view/customers_view.dart';
import '../../feature/customers/view/customers_wrapper_view.dart';
import '../../feature/customers/view/detect_location_view.dart';
import '../../feature/dashboard/view/dashboard_view.dart';
import '../../feature/dashboard/view/dashboard_wrapper_view.dart';
import '../../feature/projects/view/create_projects_view.dart';
import '../../feature/projects/view/projects_detail_view.dart';
import '../../feature/projects/view/projects_view.dart';
import '../../feature/projects/view/projects_wrapper_view.dart';
import '../../feature/root/view/root_view.dart';
import '../../feature/settings/view/alerts_view.dart';
import '../../feature/settings/view/create_user_view.dart';
import '../../feature/settings/view/my_profile_view.dart';
import '../../feature/settings/view/role_view.dart';
import '../../feature/settings/view/settings_view.dart';
import '../../feature/settings/view/settings_wrapper_view.dart';
import '../../feature/settings/view/system_settings_view.dart';
import '../../feature/settings/view/users_detail_view.dart';
import '../../feature/settings/view/users_view.dart';
import '../../models/member.dart';

part './router_generator.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: OnBoardView,
  
    ),
     AutoRoute(
      page: EmptyView,
      initial: true
    ),
    rootAutoRoute,
    AutoRoute(page: LoginView),
    AutoRoute(page: SignUpView),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {


}
