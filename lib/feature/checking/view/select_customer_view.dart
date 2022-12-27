import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/route/router_generator.dart';
import '../../../core/service/dependecy_service.dart';
import '../../../core/util/extension.dart';
import '../../../core/widgets/bodylarge.dart';
import '../../../core/widgets/headline6.dart';
import '../../../models/customer_service.dart';

class SelectCustomerView extends StatelessWidget {
  const SelectCustomerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(
          data: 'Müşteri Seç',
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 250,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.router.push(CreateChecksRoute(
                  customer: getIt.get<CustomerMobx>().customers[index]));
            },
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      context.getPath(folder: 'images', file: 'item.png'),
                      fit: BoxFit.cover,
                      width: context.dynamicWidth(1),
                      height: 120,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Bodylarge(
                        data: getIt
                                .get<CustomerMobx>()
                                .customers[index]
                                .musteriFirmaAdi ??
                            ' '),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: getIt.get<CustomerMobx>().customers.length,
      ),
    );
  }
}
