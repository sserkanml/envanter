import 'package:aden_envanterus/core/route/router_generator.dart';
import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:aden_envanterus/models/checks_service.dart';
import 'package:aden_envanterus/models/customer_service.dart';
import 'package:aden_envanterus/models/items_service.dart';
import 'package:aden_envanterus/models/projects_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';

import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/headline5.dart';

List<Widget> getChildrenTabs(BuildContext context) => <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Headline5(data: 'Projeler', color: Colors.white),
          const SizedBox(
            height: 25,
          ),
          Headline6(
            data: getIt.get<ProjectsMobx>().projects.length.toString(),
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          
          
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Headline5(data: 'Müşteriler', color: Colors.white),
          const SizedBox(
            height: 20,
          ),
          Headline6(
            data: getIt.get<CustomerMobx>().customers.length.toString(),
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          
       
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Headline5(data: 'Malzeme', color: Colors.white),
          const SizedBox(
            height: 20,
          ),
          Headline6(
            data: getIt.get<ItemsMobx>().items.length.toString(),
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
         
         
       
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Headline5(data: 'Sayımlar', color: Colors.white),
          const SizedBox(
            height: 20,
          ),
          Headline6(
            data: getIt.get<CheckMobx>().checks.length.toString(),
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          
       
        ],
      ),
    ];
