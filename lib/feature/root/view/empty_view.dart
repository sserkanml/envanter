import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/route/router_generator.dart';
import '../../../core/service/dependecy_service.dart';
import '../../../core/service/shared_references.dart';
import '../../../models/member_service.dart';
import '../../../models/projects_service.dart';

class EmptyView extends StatefulWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  State<EmptyView> createState() => _EmptyViewState();
}

class _EmptyViewState extends State<EmptyView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (getIt.get<Shared>().pref.getBool('isLogin') ?? false) {
      
        await getIt.get<MemberMobx>().getAllMembers();
        await getIt.get<ProjectsMobx>().getAllProjects();
        context.router.push(const RootRoute());
      } else {
        context.router.push(const OnBoardRoute());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
