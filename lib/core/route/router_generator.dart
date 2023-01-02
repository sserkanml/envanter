import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../feature/authentication/view/login_view.dart';
import '../../feature/authentication/view/sign_up_view.dart';
import '../../feature/checking/model/check_qr_model.dart';
import '../../feature/checking/view/canceled_check_view.dart';
import '../../feature/checking/view/checks_detail_view..dart';
import '../../feature/checking/view/checks_view.dart';
import '../../feature/checking/view/checks_wrapper_view.dart';
import '../../feature/checking/view/confirmed_view.dart';
import '../../feature/checking/view/create_checks_view.dart';
import '../../feature/checking/view/pending_checking_view.dart';
import '../../feature/checking/view/scan_qr_code_view.dart';
import '../../feature/checking/view/select_customer_view.dart';
import '../../feature/checking/view/show_checked_image.dart';
import '../../feature/checking/view/take_picture_for_checks_view.dart';
import '../../feature/customers/view/create_customers_view.dart';
import '../../feature/customers/view/custom_select_location_view.dart';
import '../../feature/customers/view/customer_detail_view.dart';
import '../../feature/customers/view/customers_view.dart';
import '../../feature/customers/view/customers_wrapper_view.dart';
import '../../feature/customers/view/detail_location_view.dart';
import '../../feature/customers/view/detect_location_view.dart';
import '../../feature/customers/view/gps_view.dart';
import '../../feature/dashboard/view/dashboard_view.dart';
import '../../feature/dashboard/view/dashboard_wrapper_view.dart';
import '../../feature/items/view/items_detail_view.dart';
import '../../feature/items/view/items_view.dart';
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
import '../../feature/start/view/on_board_view.dart';
import '../../models/checks_detail_model.dart';
import '../../models/checks_model.dart';
import '../../models/customer_model.dart';
import '../../models/items_model.dart';
import '../../models/member.dart';
import '../../models/projets_model.dart';
import 'root_router.dart';

part './router_generator.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: OnBoardView, initial: true),
    CustomRoute<double?>(page: ScanQrCodeView),
    CustomRoute<bool>(page: TakePictureForChecksView,),
    rootAutoRoute,
    AutoRoute(page: LoginView),
    AutoRoute(page: SignUpView),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
