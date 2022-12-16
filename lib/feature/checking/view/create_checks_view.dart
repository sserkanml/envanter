import 'package:flutter/material.dart';

import '../../../core/widgets/headline6.dart';

class CreateChecksView extends StatelessWidget {
const CreateChecksView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Sayım Oluştur'),
      ),
      body: SafeArea(child:
      SingleChildScrollView(child: Column(
        children: <Widget>[
          
        ],
      ),)),
    );
  }
}