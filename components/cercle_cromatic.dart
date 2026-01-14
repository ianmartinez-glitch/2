import 'dart:math';

import 'package:flutter/cupertino.dart';

class CercleCromatic extends StatefulWidget {
  final Color colorCercle;
  final Function(Color) enCanviarColor;
  const CercleCromatic({
    super.key,
    required this.colorCercle,
    required this.enCanviarColor
  });

  @override
  State<CercleCromatic> createState() => _CercleCromaticState();
}

class _CercleCromaticState extends State<CercleCromatic> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) => canviarColor(details.localPosition),
      onPanEnd: (details) => canviarColor(details.localPosition),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.colorCercle
        ),
      ),
    );
  }

  void canviarColor(Offset posicio) {
    final double centreX = 125;
    final double centreY = 125;
    final double dx = posicio.dx - centreX;
    final double dy = posicio.dy - centreY;

    double graus = atan2(dy, dx) * 180 / pi;
    if(graus < 0) graus += 360;

    final colorSelecionat = HSVColor.fromAHSV(1, graus, 1, 1).toColor();
    widget.enCanviarColor(colorSelecionat);
  }
}