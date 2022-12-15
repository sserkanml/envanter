import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';

class Headline3 extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final Color? color;
  final double? opacity;
  const Headline3(
      {Key? key, required this.data, this.fontWeight,  this.color, this.opacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: context.textTheme.headline3!.copyWith(
          color: color ?? context.colorScheme.onSurface,
          fontWeight: fontWeight),
    );
  }
}