import 'package:applicacio_tr/components/menu_editar_escena.dart';
import 'package:applicacio_tr/core/colors_app.dart';
import 'package:flutter/cupertino.dart';

class BotoCrearEscena extends StatefulWidget {
  final Function(Informacio) afegirEscena;
  const BotoCrearEscena({super.key, required this.afegirEscena});

  @override
  State<BotoCrearEscena> createState() => _BotoCrearEscenaState();
}

class _BotoCrearEscenaState extends State<BotoCrearEscena> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: ColorsApp.primari,
        borderRadius: BorderRadius.circular(30)
      ),
      child: CupertinoButton(
        child: Icon(CupertinoIcons.add, color: ColorsApp.text),
        onPressed: () async{
          final novaEscena = await menuEditarEscena(context, null);
          if (novaEscena != null){
            widget.afegirEscena(novaEscena);
          }
        }
      )
    );
  }
}