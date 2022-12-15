import 'package:aden_envanterus/feature/checking/view/checks_view.dart';
import 'package:aden_envanterus/feature/checking/view/checks_wrapper_view.dart';
import 'package:aden_envanterus/feature/checking/view/confirmed_view.dart';
import 'package:aden_envanterus/feature/checking/view/create_checks_view.dart';
import 'package:aden_envanterus/feature/checking/view/pending_checking_view.dart';
import 'package:aden_envanterus/feature/customers/view/customers_view.dart';
import 'package:aden_envanterus/feature/customers/view/customers_wrapper_view.dart';
import 'package:aden_envanterus/feature/customers/view/detect_location_view.dart';
import 'package:aden_envanterus/feature/dashboard/view/dashboard_view.dart';
import 'package:aden_envanterus/feature/dashboard/view/dashboard_wrapper_view.dart';
import 'package:aden_envanterus/feature/projects/view/create_projects_view.dart';
import 'package:aden_envanterus/feature/projects/view/projects_detail_view.dart';
import 'package:aden_envanterus/feature/projects/view/projects_view.dart';
import 'package:aden_envanterus/feature/projects/view/projects_wrapper_view.dart';
import 'package:aden_envanterus/feature/root/view/root_view.dart';

import 'package:aden_envanterus/feature/settings/view/create_user_view.dart';
import 'package:aden_envanterus/feature/settings/view/my_profile_view.dart';
import 'package:aden_envanterus/feature/settings/view/role_view.dart';
import 'package:aden_envanterus/feature/settings/view/settings_view.dart';
import 'package:aden_envanterus/feature/settings/view/settings_wrapper_view.dart';
import 'package:aden_envanterus/feature/settings/view/users_view.dart';
import 'package:auto_route/auto_route.dart';

import '../../feature/customers/view/create_customers_view.dart';

const rootAutoRoute = CustomRoute(
    page: RootView,
    path: '/root',
    transitionsBuilder: TransitionsBuilders.noTransition,
    reverseDurationInMilliseconds: 0,
    durationInMilliseconds: 0,
    children: [
      CustomRoute(
          page: DashboardWrapperView,
          path: '',
          transitionsBuilder: TransitionsBuilders.noTransition,
          reverseDurationInMilliseconds: 0,
          durationInMilliseconds: 0,
          initial: true,
          children: [
            CustomRoute(
              page: DashboardView,
              path: '',
              transitionsBuilder: TransitionsBuilders.noTransition,
              reverseDurationInMilliseconds: 0,
              durationInMilliseconds: 0,
            ),
          ]),
      CustomRoute(
        page: ProjectsWrapperView,
        children: [
          CustomRoute(page: ProjectsView, path: ""),
          CustomRoute(page: CreateProjectsView, path: 'create-project'),
          CustomRoute(page: ProjectsDetailView, path: 'project-detail'),
        ],
        transitionsBuilder: TransitionsBuilders.noTransition,
        reverseDurationInMilliseconds: 0,
        durationInMilliseconds: 0,
      ),
      CustomRoute(page: CustomersWrapperView, children: [
        CustomRoute(page: CustomersView, path: ''),
        CustomRoute(page: CreateCustomersView, path: 'create-customers'),
        CustomRoute(page: DetectLocationView, path: 'detect-location'),
      ]),
      CustomRoute(page: ChecksWrapperView, children: [
        CustomRoute(page: ChecksView, path: ''),
        CustomRoute(page: ConfirmedView, path: 'confirmed'),
        CustomRoute(page: CreateChecksView, path: 'create-checks'),
        CustomRoute(page: PendingCheckingView, path: 'pending')
      ]),
      CustomRoute(page: SettingsWrapperView, children: [
        CustomRoute(page: SettingsView, path: ''),
        CustomRoute(page: CreateUserView),
        CustomRoute(page: MyProfileView),
        CustomRoute(page: RoleView),
        CustomRoute(page: UsersView),
      ])
    ]);
