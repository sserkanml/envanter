import 'package:aden_envanterus/core/route/router_generator.dart';
import 'package:aden_envanterus/core/widgets/bodysmall.dart';
import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kartal/kartal.dart';

class ChecksView extends StatelessWidget {
  const ChecksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Sayımlar'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
              width: context.dynamicWidth(1),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  GFButton(
                    onPressed: () {
                      context.router.push(const CreateChecksRoute());
                    },
                    child: const Bodysmall(
                      data: 'Sayım Başlat',
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width:20),
                  GFButton(
                    color: GFColors.DANGER,
                    onPressed: () {
                      context.router.push(const PendingCheckingRoute());
                    },
                    child: const Bodysmall(
                      data: 'Bekleyen Sayımlar',
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width:20),
                  GFButton(
                    color: GFColors.WARNING,
                    onPressed: () {
                      context.router.push(const ConfirmedRoute());
                    },
                    child: const Bodysmall(
                      data: 'Onaylanan Sayımlar',
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
          ],
        ),
      )),
    );
  }
}
