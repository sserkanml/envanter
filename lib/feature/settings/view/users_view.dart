import 'package:aden_envanterus/core/route/router_generator.dart';
import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/core/widgets/bodysmall.dart';
import 'package:aden_envanterus/models/member_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/headline6.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Headline6(data: 'Kullanıcılar'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Arama Yap',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(height: 10),
            ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    subtitle: Bodysmall(
                      data: 'Kullanıcı Adı',
                      color: context.colorScheme.onSurface.withOpacity(.3),
                    ),
                    trailing: GFButton(
                      color: GFColors.SUCCESS,
                      onPressed: () {
                        context.router.push(UsersDetailRoute(
                            member: getIt.get<MemberMobx>().members[index]));
                      },
                      child: const Bodysmall(
                        data: 'Detay',
                        color: Colors.white,
                      ),
                    ),
                    title: Bodymedium(
                        data: getIt
                                .get<MemberMobx>()
                                .members[index]
                                .kullaniciAdi ??
                            ''),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 0,
                    color: context.colorScheme.onSurface.withOpacity(.3),
                  );
                },
                itemCount: getIt.get<MemberMobx>().members.length)
          ],
        ),
      )),
    );
  }
}
