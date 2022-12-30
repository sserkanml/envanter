import 'package:aden_envanterus/core/service/shared_references.dart';
import 'package:aden_envanterus/models/items_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/route/router_generator.dart';
import '../../../core/service/dependecy_service.dart';
import '../../../core/util/extension.dart';
import '../../../core/widgets/headline6.dart';
import '../../../models/customer_model.dart';
import '../../../models/items_service.dart';

class CreateChecksView extends StatefulWidget {
  final CustomerModel customer;
  const CreateChecksView({Key? key, required this.customer}) : super(key: key);

  @override
  State<CreateChecksView> createState() => _CreateChecksViewState();
}

class _CreateChecksViewState extends State<CreateChecksView> {
  late List<ItemsModel> items;
  late bool isFirstUsage;
  @override
  Future<void> initState() async {
    isFirstUsage = getIt.get<Shared>().pref.getBool('isFirstUsage') ?? false;
    items = getIt
        .get<ItemsMobx>()
        .items
        .where((element) => element.musteriID == widget.customer.oid)
        .toList();

    super.initState();
  }

  @override
  void dispose() {
    getIt.get<Shared>().pref.setBool('isFirstUsage', false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: SvgPicture.asset(
          context.getPath(folder: 'svg', file: 'qr_code.svg'),
          color: Colors.white,
          width: 30,
          height: 30,
        ),
      ),
      appBar: AppBar(
        title: const Headline6(data: 'Sayım Oluştur'),
        leading: IconButton(
          onPressed: () {
            context.router
                .popUntil((route) => route.settings.name == ChecksRoute.name);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
