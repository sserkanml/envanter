
import 'package:flutter/material.dart';

import '../../../core/service/dependecy_service.dart';
import '../../../core/widgets/headline5.dart';
import '../../../core/widgets/headline6.dart';
import '../../../models/checks_service.dart';
import '../../../models/customer_service.dart';
import '../../../models/items_service.dart';
import '../../../models/projects_service.dart';

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
