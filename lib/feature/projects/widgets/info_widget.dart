import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/bodylarge.dart';
import '../../../core/widgets/bodymedium.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String data;
  const InfoWidget({Key? key, required this.title, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Bodylarge(data: title,color: context.colorScheme.onSurface.withOpacity(.5),
        fontWeight: FontWeight.bold,),
        const SizedBox(
          height: 5,
        ),
        Bodymedium(data: data)
      ],
    );
  }
}
