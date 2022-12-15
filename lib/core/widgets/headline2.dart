import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';

class Headline2 extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final Color? color;
  const Headline2(
      {Key? key, required this.data, this.fontWeight,  this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: context.textTheme.headline2!.copyWith(
          color: color ?? context.colorScheme.onSurface,
          fontWeight: fontWeight),
    );
  }
}