import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class LocationWrapperView extends StatelessWidget {
const LocationWrapperView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: AutoRouter(),
    );
  }
}