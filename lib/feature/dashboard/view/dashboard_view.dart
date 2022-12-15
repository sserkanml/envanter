import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:flutter/material.dart';
import 'package:tab_container/tab_container.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Headline6(data: 'Dashboard'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: const <Widget>[],
        ),
      )),
    );
  }
}
