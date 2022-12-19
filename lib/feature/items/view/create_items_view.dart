import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:flutter/material.dart';

class CreateItemsView extends StatelessWidget {
  const CreateItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Malzeme Oluştur'),
      ),
      body: SafeArea(child:
      SingleChildScrollView(child: Column(
        children: [
          
        ],
      ),)),
    );
  }
}
