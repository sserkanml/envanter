import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';

class Bodylarge extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? align;

  final double? opacity;
  const Bodylarge(
      {Key? key, required this.data, this.fontWeight, this.color, this.opacity, this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: align,
      style: context.textTheme.bodyLarge!.copyWith(
          color:
              color ?? context.colorScheme.onSurface.withOpacity(opacity ?? 1),
          fontWeight: fontWeight),
    );
  }
}
