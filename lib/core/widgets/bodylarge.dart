import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';

class Bodylarge extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final Color? color;
  
  final double? opacity;
  const Bodylarge(
      {Key? key, required this.data, this.fontWeight, required this.color, this.opacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: context.textTheme.bodyLarge!.copyWith(
          color: color ?? context.colorScheme.onSurface.withOpacity(opacity ?? 1),
          fontWeight: fontWeight),
    );
  }
}
