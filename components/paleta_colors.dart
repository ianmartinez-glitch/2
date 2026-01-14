import 'package:applicacio_tr/components/boto_paleta.dart';
import 'package:flutter/cupertino.dart';

class PaletaColors extends StatefulWidget {
  final Function(Color) enPremerColor;
  final Color colorActual; //Color del cercle
  
  const PaletaColors({
    super.key,
    required this.enPremerColor,
    required this.colorActual
  });

  @override
  State<PaletaColors> createState() => _PaletaColorsState();
}

class _PaletaColorsState extends State<PaletaColors> {
  Color? color;
  void rebreColor(Color colorRebut){
    widget.enPremerColor(colorRebut);
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: CupertinoButton(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(27),
            child: SizedBox.shrink(),
            onPressed: (){
              widget.enPremerColor(Color(0xFFFFFFFF));
            }
          ),
        ),
        BotoPaleta(index: 0, colorActual: widget.colorActual, enPremerColor: rebreColor),
        BotoPaleta(index: 1, colorActual: widget.colorActual, enPremerColor: rebreColor),
        BotoPaleta(index: 2, colorActual: widget.colorActual, enPremerColor: rebreColor),
        BotoPaleta(index: 3, colorActual: widget.colorActual, enPremerColor: rebreColor)    
      ],
    );
  }
}