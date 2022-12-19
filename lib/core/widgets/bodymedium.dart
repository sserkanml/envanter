import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';

class Bodymedium extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final Color? color;
  final double? opacity;
  final int? maxLines;
  final TextAlign? textalign;
  const Bodymedium(
      {Key? key,
      required this.data,
      this.fontWeight,
      this.color,
      this.opacity,
      this.textalign, this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textalign,
      style: context.textTheme.bodyMedium!.copyWith(
          color:
              color ?? context.colorScheme.onSurface.withOpacity(opacity ?? 1),
          fontWeight: fontWeight),
    );
  }
}
