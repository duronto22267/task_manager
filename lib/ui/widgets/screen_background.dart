import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/img_path.dart';

class ScreenBackgroundWidget extends StatelessWidget {
  const ScreenBackgroundWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          ImgPath.backgroundImage,
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.cover,
        ),
        SafeArea(child: child)
      ],
    );
  }
}
