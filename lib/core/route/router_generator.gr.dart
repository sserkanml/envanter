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
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,

  }) : super(navigatorKey);

  final LoginGuard loginGuard=LoginGuard();

  @override
  final Map<String, PageFactory> pagesMap = {
    OnBoardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OnBoardView(),
      );
    },
    EmptyRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EmptyView(),
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
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ProjectsDetailView(),
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
    CreateChecksRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const CreateChecksView(),
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
          path: '/on-board-view',
        ),
        RouteConfig(
          EmptyRoute.name,
          path: '/',
        ),
        RouteConfig(
          RootRoute.name,
          path: '/root',
          guards: [loginGuard],
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
                  CreateCustomersRoute.name,
                  path: 'create-customers',
                  parent: CustomersWrapperRoute.name,
                ),
                RouteConfig(
                  DetectLocationRoute.name,
                  path: 'detect-location',
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
                  CreateChecksRoute.name,
                  path: 'create-checks',
                  parent: ChecksWrapperRoute.name,
                ),
                RouteConfig(
                  PendingCheckingRoute.name,
                  path: 'pending',
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
          path: '/on-board-view',
        );

  static const String name = 'OnBoardRoute';
}

/// generated route for
/// [EmptyView]
class EmptyRoute extends PageRouteInfo<void> {
  const EmptyRoute()
      : super(
          EmptyRoute.name,
          path: '/',
        );

  static const String name = 'EmptyRoute';
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
class ProjectsDetailRoute extends PageRouteInfo<void> {
  const ProjectsDetailRoute()
      : super(
          ProjectsDetailRoute.name,
          path: 'project-detail',
        );

  static const String name = 'ProjectsDetailRoute';
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
          path: 'detect-location',
        );

  static const String name = 'DetectLocationRoute';
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
/// [CreateChecksView]
class CreateChecksRoute extends PageRouteInfo<void> {
  const CreateChecksRoute()
      : super(
          CreateChecksRoute.name,
          path: 'create-checks',
        );

  static const String name = 'CreateChecksRoute';
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
