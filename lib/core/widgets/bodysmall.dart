import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';

class Bodysmall extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final Color? color;
  final double? opacity;
  const Bodysmall(
      {Key? key, required this.data, this.fontWeight, required this.color,  this.opacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: context.textTheme.bodySmall!.copyWith(
          color: color ?? context.colorScheme.onSurface.withOpacity(opacity ?? 1),
          fontWeight: fontWeight),
    );
  }
}
