import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';

class Headline5 extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final Color? color;
  final double? opacity;
  const Headline5(
      {Key? key, required this.data, this.fontWeight, required this.color, this.opacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: context.textTheme.headline5!.copyWith(
          color: color ?? context.colorScheme.onSurface,
          fontWeight: fontWeight),
    );
  }
}