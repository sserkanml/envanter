import 'dart:io';

import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:aden_envanterus/feature/checking/model/take_picture_mobx.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ShowCheckedImageView extends StatelessWidget {
  const ShowCheckedImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Çekilen Resimler'),
        actions: [
          IconButton(
            onPressed: () {
              getIt.get<TakePicture>().refreshState();
              context.router.pop<bool>(false);
            },
            icon: const Icon(
              Icons.delete,
              size: 25,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: PageView.builder(
            itemBuilder: (context, index) {
              return Image.file(
                File(getIt.get<TakePicture>().takePicture[index].path),
                fit: BoxFit.cover,
              );
            },
            itemCount: getIt.get<TakePicture>().getListLength,
          ))
        ],
      ),
    );
  }
}
