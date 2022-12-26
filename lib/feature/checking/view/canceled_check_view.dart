import 'package:flutter/material.dart';

import '../../../core/widgets/headline6.dart';

class CanceledCheckView extends StatelessWidget {
  const CanceledCheckView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'İptal Edilen Sayımlar'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
