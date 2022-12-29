// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router_generator.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    OnBoardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OnBoardView(),
      );
    },
    ScanQrCodeRoute.name: (routeData) {
      final args = routeData.argsAs<ScanQrCodeRouteArgs>();
      return CustomPage<double>(
        routeData: routeData,
        child: ScanQrCodeView(
          key: args.key,
          qrModel: args.qrModel,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    RootRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const RootView(),
        transitionsBuilder: TransitionsBuilders.noTransition,
        durationInMilliseconds: 0,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LoginView(),
      );
    },
    SignUpRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignUpView(),
      );
    },
    DashboardWrapperRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const DashboardWrapperView(),
        transitionsBuilder: TransitionsBuilders.noTransition,
        durationInMilliseconds: 0,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProjectsWrapperRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ProjectsWrapperView(),
        transitionsBuilder: TransitionsBuilders.noTransition,
        durationInMilliseconds: 0,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CustomersWrapperRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const CustomersWrapperView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChecksWrapperRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ChecksWrapperView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SettingsWrapperRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const SettingsWrapperView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    DashboardRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const DashboardView(),
        transitionsBuilder: TransitionsBuilders.noTransition,
        durationInMilliseconds: 0,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProjectsRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ProjectsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CreateProjectsRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const CreateProjectsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProjectsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectsDetailRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: ProjectsDetailView(
          key: args.key,
          project: args.project,
          projectsId: args.projectsId,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CustomersRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const CustomersView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CustomerDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CustomerDetailRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: CustomerDetailView(
          key: args.key,
          customer: args.customer,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CreateCustomersRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const CreateCustomersView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    DetectLocationRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const DetectLocationView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    GpsRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const GpsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    DetailLocationRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const DetailLocationView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CustomSelectLocationRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const CustomSelectLocationView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChecksRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ChecksView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ConfirmedRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ConfirmedView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SelectCustomerRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const SelectCustomerView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    TakePictureForChecksRoute.name: (routeData) {
      final args = routeData.argsAs<TakePictureForChecksRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: TakePictureForChecksView(
          key: args.key,
          takenPhoto: args.takenPhoto,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CreateChecksRoute.name: (routeData) {
      final args = routeData.argsAs<CreateChecksRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: CreateChecksView(
          key: args.key,
          customer: args.customer,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    PendingCheckingRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const PendingCheckingView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CanceledCheckRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const CanceledCheckView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ItemsRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ItemsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ItemsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ItemsDetailRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: ItemsDetailView(
          key: args.key,
          item: args.item,
          customer: args.customer,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CheckDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CheckDetailRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: CheckDetailView(
          key: args.key,
          customer: args.customer,
          item: args.item,
          checkDetail: args.checkDetail,
          check: args.check,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SettingsRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const SettingsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CreateUserRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const CreateUserView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    MyProfileRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const MyProfileView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    RoleRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const RoleView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SystemSettingsRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const SystemSettingsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UsersRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const UsersView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    AlertsRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const AlertsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UsersDetailRoute.name: (routeData) {
      final args = routeData.argsAs<UsersDetailRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: UsersDetailView(
          key: args.key,
          member: args.member,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          OnBoardRoute.name,
          path: '/',
        ),
        RouteConfig(
          ScanQrCodeRoute.name,
          path: '/scan-qr-code-view',
        ),
        RouteConfig(
          RootRoute.name,
          path: '/root',
          children: [
            RouteConfig(
              DashboardWrapperRoute.name,
              path: '',
              parent: RootRoute.name,
              children: [
                RouteConfig(
                  DashboardRoute.name,
                  path: '',
                  parent: DashboardWrapperRoute.name,
                )
              ],
            ),
            RouteConfig(
              ProjectsWrapperRoute.name,
              path: 'projects-wrapper-view',
              parent: RootRoute.name,
              children: [
                RouteConfig(
                  ProjectsRoute.name,
                  path: '',
                  parent: ProjectsWrapperRoute.name,
                ),
                RouteConfig(
                  CreateProjectsRoute.name,
                  path: 'create-project',
                  parent: ProjectsWrapperRoute.name,
                ),
                RouteConfig(
                  ProjectsDetailRoute.name,
                  path: 'project-detail',
                  parent: ProjectsWrapperRoute.name,
                ),
              ],
            ),
            RouteConfig(
              CustomersWrapperRoute.name,
              path: 'customers-wrapper-view',
              parent: RootRoute.name,
              children: [
                RouteConfig(
                  CustomersRoute.name,
                  path: '',
                  parent: CustomersWrapperRoute.name,
                ),
                RouteConfig(
                  CustomerDetailRoute.name,
                  path: 'customer-detail-view',
                  parent: CustomersWrapperRoute.name,
                ),
                RouteConfig(
                  CreateCustomersRoute.name,
                  path: 'create-customers',
                  parent: CustomersWrapperRoute.name,
                ),
                RouteConfig(
                  DetectLocationRoute.name,
                  path: 'detect-location-view',
                  parent: CustomersWrapperRoute.name,
                ),
                RouteConfig(
                  GpsRoute.name,
                  path: 'gps-view',
                  parent: CustomersWrapperRoute.name,
                ),
                RouteConfig(
                  DetailLocationRoute.name,
                  path: 'detail-location-view',
                  parent: CustomersWrapperRoute.name,
                ),
                RouteConfig(
                  CustomSelectLocationRoute.name,
                  path: 'custom-select-location-view',
                  parent: CustomersWrapperRoute.name,
                ),
              ],
            ),
            RouteConfig(
              ChecksWrapperRoute.name,
              path: 'checks-wrapper-view',
              parent: RootRoute.name,
              children: [
                RouteConfig(
                  ChecksRoute.name,
                  path: '',
                  parent: ChecksWrapperRoute.name,
                ),
                RouteConfig(
                  ConfirmedRoute.name,
                  path: 'confirmed',
                  parent: ChecksWrapperRoute.name,
                ),
                RouteConfig(
                  SelectCustomerRoute.name,
                  path: 'select-customer',
                  parent: ChecksWrapperRoute.name,
                ),
                RouteConfig(
                  TakePictureForChecksRoute.name,
                  path: 'take-picture',
                  parent: ChecksWrapperRoute.name,
                ),
                RouteConfig(
                  CreateChecksRoute.name,
                  path: 'create-checks',
                  parent: ChecksWrapperRoute.name,
                ),
                RouteConfig(
                  PendingCheckingRoute.name,
                  path: 'pending',
                  parent: ChecksWrapperRoute.name,
                ),
                RouteConfig(
                  CanceledCheckRoute.name,
                  path: 'canceled',
                  parent: ChecksWrapperRoute.name,
                ),
                RouteConfig(
                  ItemsRoute.name,
                  path: 'items-view',
                  parent: ChecksWrapperRoute.name,
                ),
                RouteConfig(
                  ItemsDetailRoute.name,
                  path: 'items-detail-view',
                  parent: ChecksWrapperRoute.name,
                ),
                RouteConfig(
                  CheckDetailRoute.name,
                  path: 'check-detail-view',
                  parent: ChecksWrapperRoute.name,
                ),
              ],
            ),
            RouteConfig(
              SettingsWrapperRoute.name,
              path: 'settings-wrapper-view',
              parent: RootRoute.name,
              children: [
                RouteConfig(
                  SettingsRoute.name,
                  path: '',
                  parent: SettingsWrapperRoute.name,
                ),
                RouteConfig(
                  CreateUserRoute.name,
                  path: 'create-user-view',
                  parent: SettingsWrapperRoute.name,
                ),
                RouteConfig(
                  MyProfileRoute.name,
                  path: 'my-profile-view',
                  parent: SettingsWrapperRoute.name,
                ),
                RouteConfig(
                  RoleRoute.name,
                  path: 'role-view',
                  parent: SettingsWrapperRoute.name,
                ),
                RouteConfig(
                  SystemSettingsRoute.name,
                  path: 'system-settings-view',
                  parent: SettingsWrapperRoute.name,
                ),
                RouteConfig(
                  UsersRoute.name,
                  path: 'users-view',
                  parent: SettingsWrapperRoute.name,
                ),
                RouteConfig(
                  AlertsRoute.name,
                  path: 'alerts-view',
                  parent: SettingsWrapperRoute.name,
                ),
                RouteConfig(
                  UsersDetailRoute.name,
                  path: 'users-detail-view',
                  parent: SettingsWrapperRoute.name,
                ),
              ],
            ),
          ],
        ),
        RouteConfig(
          LoginRoute.name,
          path: '/login-view',
        ),
        RouteConfig(
          SignUpRoute.name,
          path: '/sign-up-view',
        ),
      ];
}

/// generated route for
/// [OnBoardView]
class OnBoardRoute extends PageRouteInfo<void> {
  const OnBoardRoute()
      : super(
          OnBoardRoute.name,
          path: '/',
        );

  static const String name = 'OnBoardRoute';
}

/// generated route for
/// [ScanQrCodeView]
class ScanQrCodeRoute extends PageRouteInfo<ScanQrCodeRouteArgs> {
  ScanQrCodeRoute({
    Key? key,
    required CheckQrModel qrModel,
  }) : super(
          ScanQrCodeRoute.name,
          path: '/scan-qr-code-view',
          args: ScanQrCodeRouteArgs(
            key: key,
            qrModel: qrModel,
          ),
        );

  static const String name = 'ScanQrCodeRoute';
}

class ScanQrCodeRouteArgs {
  const ScanQrCodeRouteArgs({
    this.key,
    required this.qrModel,
  });

  final Key? key;

  final CheckQrModel qrModel;

  @override
  String toString() {
    return 'ScanQrCodeRouteArgs{key: $key, qrModel: $qrModel}';
  }
}

/// generated route for
/// [RootView]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
      : super(
          RootRoute.name,
          path: '/root',
          initialChildren: children,
        );

  static const String name = 'RootRoute';
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-view',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [SignUpView]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/sign-up-view',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [DashboardWrapperView]
class DashboardWrapperRoute extends PageRouteInfo<void> {
  const DashboardWrapperRoute({List<PageRouteInfo>? children})
      : super(
          DashboardWrapperRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'DashboardWrapperRoute';
}

/// generated route for
/// [ProjectsWrapperView]
class ProjectsWrapperRoute extends PageRouteInfo<void> {
  const ProjectsWrapperRoute({List<PageRouteInfo>? children})
      : super(
          ProjectsWrapperRoute.name,
          path: 'projects-wrapper-view',
          initialChildren: children,
        );

  static const String name = 'ProjectsWrapperRoute';
}

/// generated route for
/// [CustomersWrapperView]
class CustomersWrapperRoute extends PageRouteInfo<void> {
  const CustomersWrapperRoute({List<PageRouteInfo>? children})
      : super(
          CustomersWrapperRoute.name,
          path: 'customers-wrapper-view',
          initialChildren: children,
        );

  static const String name = 'CustomersWrapperRoute';
}

/// generated route for
/// [ChecksWrapperView]
class ChecksWrapperRoute extends PageRouteInfo<void> {
  const ChecksWrapperRoute({List<PageRouteInfo>? children})
      : super(
          ChecksWrapperRoute.name,
          path: 'checks-wrapper-view',
          initialChildren: children,
        );

  static const String name = 'ChecksWrapperRoute';
}

/// generated route for
/// [SettingsWrapperView]
class SettingsWrapperRoute extends PageRouteInfo<void> {
  const SettingsWrapperRoute({List<PageRouteInfo>? children})
      : super(
          SettingsWrapperRoute.name,
          path: 'settings-wrapper-view',
          initialChildren: children,
        );

  static const String name = 'SettingsWrapperRoute';
}

/// generated route for
/// [DashboardView]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: '',
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [ProjectsView]
class ProjectsRoute extends PageRouteInfo<void> {
  const ProjectsRoute()
      : super(
          ProjectsRoute.name,
          path: '',
        );

  static const String name = 'ProjectsRoute';
}

/// generated route for
/// [CreateProjectsView]
class CreateProjectsRoute extends PageRouteInfo<void> {
  const CreateProjectsRoute()
      : super(
          CreateProjectsRoute.name,
          path: 'create-project',
        );

  static const String name = 'CreateProjectsRoute';
}

/// generated route for
/// [ProjectsDetailView]
class ProjectsDetailRoute extends PageRouteInfo<ProjectsDetailRouteArgs> {
  ProjectsDetailRoute({
    Key? key,
    required ProjectsModel project,
    required CustomerModel? projectsId,
  }) : super(
          ProjectsDetailRoute.name,
          path: 'project-detail',
          args: ProjectsDetailRouteArgs(
            key: key,
            project: project,
            projectsId: projectsId,
          ),
        );

  static const String name = 'ProjectsDetailRoute';
}

class ProjectsDetailRouteArgs {
  const ProjectsDetailRouteArgs({
    this.key,
    required this.project,
    required this.projectsId,
  });

  final Key? key;

  final ProjectsModel project;

  final CustomerModel? projectsId;

  @override
  String toString() {
    return 'ProjectsDetailRouteArgs{key: $key, project: $project, projectsId: $projectsId}';
  }
}

/// generated route for
/// [CustomersView]
class CustomersRoute extends PageRouteInfo<void> {
  const CustomersRoute()
      : super(
          CustomersRoute.name,
          path: '',
        );

  static const String name = 'CustomersRoute';
}

/// generated route for
/// [CustomerDetailView]
class CustomerDetailRoute extends PageRouteInfo<CustomerDetailRouteArgs> {
  CustomerDetailRoute({
    Key? key,
    required CustomerModel customer,
  }) : super(
          CustomerDetailRoute.name,
          path: 'customer-detail-view',
          args: CustomerDetailRouteArgs(
            key: key,
            customer: customer,
          ),
        );

  static const String name = 'CustomerDetailRoute';
}

class CustomerDetailRouteArgs {
  const CustomerDetailRouteArgs({
    this.key,
    required this.customer,
  });

  final Key? key;

  final CustomerModel customer;

  @override
  String toString() {
    return 'CustomerDetailRouteArgs{key: $key, customer: $customer}';
  }
}

/// generated route for
/// [CreateCustomersView]
class CreateCustomersRoute extends PageRouteInfo<void> {
  const CreateCustomersRoute()
      : super(
          CreateCustomersRoute.name,
          path: 'create-customers',
        );

  static const String name = 'CreateCustomersRoute';
}

/// generated route for
/// [DetectLocationView]
class DetectLocationRoute extends PageRouteInfo<void> {
  const DetectLocationRoute()
      : super(
          DetectLocationRoute.name,
          path: 'detect-location-view',
        );

  static const String name = 'DetectLocationRoute';
}

/// generated route for
/// [GpsView]
class GpsRoute extends PageRouteInfo<void> {
  const GpsRoute()
      : super(
          GpsRoute.name,
          path: 'gps-view',
        );

  static const String name = 'GpsRoute';
}

/// generated route for
/// [DetailLocationView]
class DetailLocationRoute extends PageRouteInfo<void> {
  const DetailLocationRoute()
      : super(
          DetailLocationRoute.name,
          path: 'detail-location-view',
        );

  static const String name = 'DetailLocationRoute';
}

/// generated route for
/// [CustomSelectLocationView]
class CustomSelectLocationRoute extends PageRouteInfo<void> {
  const CustomSelectLocationRoute()
      : super(
          CustomSelectLocationRoute.name,
          path: 'custom-select-location-view',
        );

  static const String name = 'CustomSelectLocationRoute';
}

/// generated route for
/// [ChecksView]
class ChecksRoute extends PageRouteInfo<void> {
  const ChecksRoute()
      : super(
          ChecksRoute.name,
          path: '',
        );

  static const String name = 'ChecksRoute';
}

/// generated route for
/// [ConfirmedView]
class ConfirmedRoute extends PageRouteInfo<void> {
  const ConfirmedRoute()
      : super(
          ConfirmedRoute.name,
          path: 'confirmed',
        );

  static const String name = 'ConfirmedRoute';
}

/// generated route for
/// [SelectCustomerView]
class SelectCustomerRoute extends PageRouteInfo<void> {
  const SelectCustomerRoute()
      : super(
          SelectCustomerRoute.name,
          path: 'select-customer',
        );

  static const String name = 'SelectCustomerRoute';
}

/// generated route for
/// [TakePictureForChecksView]
class TakePictureForChecksRoute
    extends PageRouteInfo<TakePictureForChecksRouteArgs> {
  TakePictureForChecksRoute({
    Key? key,
    required int takenPhoto,
  }) : super(
          TakePictureForChecksRoute.name,
          path: 'take-picture',
          args: TakePictureForChecksRouteArgs(
            key: key,
            takenPhoto: takenPhoto,
          ),
        );

  static const String name = 'TakePictureForChecksRoute';
}

class TakePictureForChecksRouteArgs {
  const TakePictureForChecksRouteArgs({
    this.key,
    required this.takenPhoto,
  });

  final Key? key;

  final int takenPhoto;

  @override
  String toString() {
    return 'TakePictureForChecksRouteArgs{key: $key, takenPhoto: $takenPhoto}';
  }
}

/// generated route for
/// [CreateChecksView]
class CreateChecksRoute extends PageRouteInfo<CreateChecksRouteArgs> {
  CreateChecksRoute({
    Key? key,
    required CustomerModel customer,
  }) : super(
          CreateChecksRoute.name,
          path: 'create-checks',
          args: CreateChecksRouteArgs(
            key: key,
            customer: customer,
          ),
        );

  static const String name = 'CreateChecksRoute';
}

class CreateChecksRouteArgs {
  const CreateChecksRouteArgs({
    this.key,
    required this.customer,
  });

  final Key? key;

  final CustomerModel customer;

  @override
  String toString() {
    return 'CreateChecksRouteArgs{key: $key, customer: $customer}';
  }
}

/// generated route for
/// [PendingCheckingView]
class PendingCheckingRoute extends PageRouteInfo<void> {
  const PendingCheckingRoute()
      : super(
          PendingCheckingRoute.name,
          path: 'pending',
        );

  static const String name = 'PendingCheckingRoute';
}

/// generated route for
/// [CanceledCheckView]
class CanceledCheckRoute extends PageRouteInfo<void> {
  const CanceledCheckRoute()
      : super(
          CanceledCheckRoute.name,
          path: 'canceled',
        );

  static const String name = 'CanceledCheckRoute';
}

/// generated route for
/// [ItemsView]
class ItemsRoute extends PageRouteInfo<void> {
  const ItemsRoute()
      : super(
          ItemsRoute.name,
          path: 'items-view',
        );

  static const String name = 'ItemsRoute';
}

/// generated route for
/// [ItemsDetailView]
class ItemsDetailRoute extends PageRouteInfo<ItemsDetailRouteArgs> {
  ItemsDetailRoute({
    Key? key,
    required ItemsModel item,
    required CustomerModel customer,
  }) : super(
          ItemsDetailRoute.name,
          path: 'items-detail-view',
          args: ItemsDetailRouteArgs(
            key: key,
            item: item,
            customer: customer,
          ),
        );

  static const String name = 'ItemsDetailRoute';
}

class ItemsDetailRouteArgs {
  const ItemsDetailRouteArgs({
    this.key,
    required this.item,
    required this.customer,
  });

  final Key? key;

  final ItemsModel item;

  final CustomerModel customer;

  @override
  String toString() {
    return 'ItemsDetailRouteArgs{key: $key, item: $item, customer: $customer}';
  }
}

/// generated route for
/// [CheckDetailView]
class CheckDetailRoute extends PageRouteInfo<CheckDetailRouteArgs> {
  CheckDetailRoute({
    Key? key,
    required CustomerModel customer,
    required ItemsModel item,
    required CheckDetailModel checkDetail,
    required CheckModel check,
  }) : super(
          CheckDetailRoute.name,
          path: 'check-detail-view',
          args: CheckDetailRouteArgs(
            key: key,
            customer: customer,
            item: item,
            checkDetail: checkDetail,
            check: check,
          ),
        );

  static const String name = 'CheckDetailRoute';
}

class CheckDetailRouteArgs {
  const CheckDetailRouteArgs({
    this.key,
    required this.customer,
    required this.item,
    required this.checkDetail,
    required this.check,
  });

  final Key? key;

  final CustomerModel customer;

  final ItemsModel item;

  final CheckDetailModel checkDetail;

  final CheckModel check;

  @override
  String toString() {
    return 'CheckDetailRouteArgs{key: $key, customer: $customer, item: $item, checkDetail: $checkDetail, check: $check}';
  }
}

/// generated route for
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [CreateUserView]
class CreateUserRoute extends PageRouteInfo<void> {
  const CreateUserRoute()
      : super(
          CreateUserRoute.name,
          path: 'create-user-view',
        );

  static const String name = 'CreateUserRoute';
}

/// generated route for
/// [MyProfileView]
class MyProfileRoute extends PageRouteInfo<void> {
  const MyProfileRoute()
      : super(
          MyProfileRoute.name,
          path: 'my-profile-view',
        );

  static const String name = 'MyProfileRoute';
}

/// generated route for
/// [RoleView]
class RoleRoute extends PageRouteInfo<void> {
  const RoleRoute()
      : super(
          RoleRoute.name,
          path: 'role-view',
        );

  static const String name = 'RoleRoute';
}

/// generated route for
/// [SystemSettingsView]
class SystemSettingsRoute extends PageRouteInfo<void> {
  const SystemSettingsRoute()
      : super(
          SystemSettingsRoute.name,
          path: 'system-settings-view',
        );

  static const String name = 'SystemSettingsRoute';
}

/// generated route for
/// [UsersView]
class UsersRoute extends PageRouteInfo<void> {
  const UsersRoute()
      : super(
          UsersRoute.name,
          path: 'users-view',
        );

  static const String name = 'UsersRoute';
}

/// generated route for
/// [AlertsView]
class AlertsRoute extends PageRouteInfo<void> {
  const AlertsRoute()
      : super(
          AlertsRoute.name,
          path: 'alerts-view',
        );

  static const String name = 'AlertsRoute';
}

/// generated route for
/// [UsersDetailView]
class UsersDetailRoute extends PageRouteInfo<UsersDetailRouteArgs> {
  UsersDetailRoute({
    Key? key,
    required Member member,
  }) : super(
          UsersDetailRoute.name,
          path: 'users-detail-view',
          args: UsersDetailRouteArgs(
            key: key,
            member: member,
          ),
        );

  static const String name = 'UsersDetailRoute';
}

class UsersDetailRouteArgs {
  const UsersDetailRouteArgs({
    this.key,
    required this.member,
  });

  final Key? key;

  final Member member;

  @override
  String toString() {
    return 'UsersDetailRouteArgs{key: $key, member: $member}';
  }
}
