import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../util/extension.dart';

class SvgBottomIcon extends StatelessWidget {
  final String file;
  final Color color;
  const SvgBottomIcon({Key? key, required this.file, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      context.getPath(folder: "svg", file: file),
      width: 20,
      color: color,
      height: 20,
    );
  }
}
