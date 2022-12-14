import 'package:aden_envanterus/feature/checking/view/show_checked_image.dart';
import 'package:auto_route/auto_route.dart';

import '../../feature/checking/view/canceled_check_view.dart';
import '../../feature/checking/view/checks_detail_view..dart';
import '../../feature/checking/view/checks_view.dart';
import '../../feature/checking/view/checks_wrapper_view.dart';
import '../../feature/checking/view/confirmed_view.dart';
import '../../feature/checking/view/create_checks_view.dart';
import '../../feature/checking/view/pending_checking_view.dart';
import '../../feature/checking/view/select_customer_view.dart';
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
import 'router_generator.dart';

final AppRouter approuter = AppRouter();
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
        CustomRoute(
          page: CustomerDetailView,
        ),
        CustomRoute(page: CreateCustomersView, path: 'create-customers'),
      
          CustomRoute(page: DetectLocationView,),
          CustomRoute(
            page: GpsView,
          ),
          CustomRoute(
            page: DetailLocationView,
          ),
          CustomRoute(
            page: CustomSelectLocationView,
          ),
      
      ]),
      CustomRoute(page: ChecksWrapperView, children: [
        CustomRoute(page: ChecksView, path: ''),
        CustomRoute(page: ConfirmedView, path: 'confirmed'),
        CustomRoute(page: SelectCustomerView,path: 'select-customer'),
        CustomRoute<bool>(page: ShowCheckedImageView,path: 'show-checked-image'),
        CustomRoute(page: CreateChecksView, path: 'create-checks'),
        CustomRoute(page: PendingCheckingView, path: 'pending'),
        CustomRoute(page:CanceledCheckView,path:'canceled'),
     
        CustomRoute(
          page: ItemsView,
        ),
     
        CustomRoute(
          page: ItemsDetailView,
        ),
        CustomRoute(
          page: CheckDetailView,
        ),
      ]),
      CustomRoute(page: SettingsWrapperView, children: [
        CustomRoute(page: SettingsView, path: ''),
        CustomRoute(page: CreateUserView),
        CustomRoute(page: MyProfileView),
        CustomRoute(page: RoleView),
        CustomRoute(page: SystemSettingsView),
        CustomRoute(page: UsersView),
        CustomRoute(page: AlertsView),
        CustomRoute(page: UsersDetailView),
      ])
    ]);
