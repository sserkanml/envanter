import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/headline5.dart';

List<Widget> getChildrenTabs(BuildContext context) => <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Headline5(data: 'Projeler', color: Colors.white),
          SizedBox(
            height: 20,
          ),
          Bodymedium(data: 'data'),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Headline5(data: 'Müşteriler', color: Colors.white),
          SizedBox(
            height: 20,
          ),
          Bodymedium(data: 'data'),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Headline5(data: 'Malzeme', color: Colors.white),
          SizedBox(
            height: 20,
          ),
          Bodymedium(data: 'data'),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Headline5(data: 'Sayımlar', color: Colors.white),
          SizedBox(
            height: 20,
          ),
          Bodymedium(data: 'data'),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ];
