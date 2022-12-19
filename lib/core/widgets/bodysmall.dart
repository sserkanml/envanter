import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';

class Bodysmall extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final Color? color;
  final double? opacity;
  final int? maxLine;
  final TextAlign? align;
  const Bodysmall(
      {Key? key,
      required this.data,
      this.fontWeight,
      this.color,
      this.opacity,
      this.maxLine, this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
    textAlign: align,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.bodySmall!.copyWith(
          color:
              color ?? context.colorScheme.onSurface.withOpacity(opacity ?? 1),
          fontWeight: fontWeight),
    );
  }
}
