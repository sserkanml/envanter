

import 'package:flutter/material.dart';

import '../../../core/widgets/bodylarge.dart';

class TakePictureForChecksView extends StatefulWidget {
  final int takenPhoto;
  const TakePictureForChecksView({Key? key, required this.takenPhoto})
      : super(key: key);

  @override
  State<TakePictureForChecksView> createState() =>
      _TakePictureForChecksViewState();
}

class _TakePictureForChecksViewState extends State<TakePictureForChecksView> {
  late int takenPhotoCount;
  @override
  void initState() {
    takenPhotoCount = widget.takenPhoto;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Bodylarge(
            data: widget.takenPhoto.toString(),
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )
        ],
      ),
  
    );
  }
}
