import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kartal/kartal.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

import '../../../core/route/router_generator.dart';
import '../../../core/service/dependecy_service.dart';
import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/bodysmall.dart';
import '../../../core/widgets/headline6.dart';
import '../../../models/customer_model.dart';
import '../../../models/customer_service.dart';
import '../../authentication/view_model/get_login.dart';

class CustomersView extends StatefulWidget {
  const CustomersView({Key? key}) : super(key: key);

  @override
  State<CustomersView> createState() => _CustomersViewState();
}

class _CustomersViewState extends State<CustomersView> {
  late TextEditingController searchText;
  late List<CustomerModel> customerSearch;
  final _controller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _controller.stream;
  @override
  void initState() {
    searchText = TextEditingController();
    customerSearch = [...getIt.get<CustomerMobx>().customers];

    super.initState();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  void filterResult(String query) {
    List<CustomerModel> results = [];
    if (query.isEmpty) {
      results = [...getIt.get<CustomerMobx>().customers];
    } else {
      results = getIt
          .get<CustomerMobx>()
          .customers
          .where((element) => element.musteriFirmaAdi!
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }
    setState(() {
      customerSearch = results;
    });
  }

  Future<void> _refresh() async {
    await AuthenticateUser.getAllData();

    _controller.sink.add(SwipeRefreshState.hidden);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Müşteriler'),
      ),
      body: SafeArea(
          child: SwipeRefresh
              .cupertino(stateStream: _stream, onRefresh: _refresh, children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  GFIconButton(
                    icon: const Icon(FontAwesomeIcons.locationArrow),
                    onPressed: () {
                      context.router.push(const DetectLocationRoute());
                    },
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        filterResult(value);
                      },
                      controller: searchText,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Arama Yap',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 8.0,
                          )),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GFIconButton(
                    icon: const Icon(FontAwesomeIcons.plus),
                    onPressed: () async {
                      await context.router.push(const CreateCustomersRoute());
                      setState(() {
                        customerSearch = getIt.get<CustomerMobx>().customers;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(height: 20),
              ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    print(customerSearch[index].aktifPasif);
                    return ListTile(
                      trailing: Bodysmall(
                          fontWeight: FontWeight.bold,
                          color: customerSearch[index].aktifPasif == 1
                              ? Colors.orange
                              : context.colorScheme.onSurface.withOpacity(.5),
                          data: customerSearch[index].aktifPasif == 1
                              ? 'Aktif'
                              : 'Pasif'),
                      leading: const Icon(CupertinoIcons.home),
                      onTap: () {
                        context.router.push(CustomerDetailRoute(
                            customer: customerSearch[index]));
                      },
                      title: Bodymedium(
                          fontWeight: FontWeight.bold,
                          data: customerSearch[index]
                                      .musteriFirmaAdi
                                      .toString()
                                      .length >
                                  40
                              ? '${customerSearch[index].musteriFirmaAdi.toString().substring(0, 30)}...'
                              : customerSearch[index]
                                  .musteriFirmaAdi
                                  .toString()),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 0,
                      color: context.colorScheme.onSurface.withOpacity(.3),
                    );
                  },
                  itemCount: customerSearch.length)
            ],
          ),
        ),
      ])),
    );
  }
}
