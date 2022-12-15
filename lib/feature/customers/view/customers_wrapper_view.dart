import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomersWrapperView extends StatelessWidget {
const CustomersWrapperView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: AutoRouter(),
    );
  }
}