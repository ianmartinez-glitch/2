import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Dock extends StatefulWidget {
  final int indexActual;
  final Function(int) iconaSeleccionat;

  const Dock({
    super.key,
    required this.indexActual,
    required this.iconaSeleccionat
  });

  @override
  State<Dock> createState() => _DockState();
}

class _DockState extends State<Dock> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      right: 20,
      bottom: 20,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey.withOpacity(0.2)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _constructorIcona(CupertinoIcons.lightbulb, 0),
                _constructorIcona(CupertinoIcons.slider_horizontal_3, 1),
                _constructorIcona(CupertinoIcons.speaker_1_fill, 2),
                _constructorIcona(CupertinoIcons.lock, 3),
                _constructorIcona(CupertinoIcons.rectangle_on_rectangle, 4),

              ]
            ),
          ),
        ),
      )
    );
  }
  
  Widget _constructorIcona(IconData icona, int index) {
    final actiu = index == widget.indexActual;

    return GestureDetector(
      onTap: () => widget.iconaSeleccionat(index),
      child: Icon(
        icona,
        size: actiu ? 40 : 35,
        color: actiu
          ? Color(0xFFDAE4DB)
          : CupertinoColors.inactiveGray
      ),
    );

  }
}