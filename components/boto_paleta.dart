import 'package:flutter/cupertino.dart';

class BotoPaleta extends StatefulWidget {
  final int index;
  final Color colorActual;
  final Function(Color) enPremerColor;
  const BotoPaleta({
    super.key,
    required this.index,
    required this.colorActual,
    required this.enPremerColor
  });

  @override
  State<BotoPaleta> createState() => _BotoPaletaState();
}

class _BotoPaletaState extends State<BotoPaleta> {
  List<Color> colors = [
    Color(0xFFFF0000),
    Color(0xFF00FF15),
    Color(0xFF001AFF),
    Color(0xFF6F00FF)
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(27),
        color: colors[widget.index],
        child: SizedBox.shrink(),
        onPressed: () {
          widget.enPremerColor(colors[widget.index]);
        },
        onLongPress: () {
          showCupertinoDialog(
            context: context,
            builder: (_) => CupertinoAlertDialog(
              title: Text("Canviar color"),
              content: Text("Dessitges canviar el color de la paleta al color actual?"),
              actions: [
                CupertinoDialogAction(child: Text("Acceptar"), onPressed: (){
                  setState(() {
                    colors[widget.index] = widget.colorActual;
                  });
                  Navigator.pop(context);
                }),
                CupertinoDialogAction(child: Text("Cancel·lar"), onPressed: (){
                  Navigator.pop(context);
                })
              ],
            )
          );
        },
      ),
    );
  }
}