import 'package:applicacio_tr/components/menu_editar_escena.dart';
import 'package:applicacio_tr/core/colors_app.dart';
import 'package:flutter/cupertino.dart';

class BotoEscena extends StatefulWidget {
  final Informacio escena;
  final Function(Informacio) eliminarEscena;
  const BotoEscena({
    super.key,
    required this.escena,
    required this.eliminarEscena  
  });

  @override
  State<BotoEscena> createState() => _BotoEscenaState();
}

class _BotoEscenaState extends State<BotoEscena> {
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
        child: Center(child: Text(widget.escena.nomEscena, textAlign: TextAlign.center, style: TextStyle(color: ColorsApp.text),)),
        onPressed: () {}, //Enviar informació a arduino 
        onLongPress: ()async {
          showCupertinoDialog<String>(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text(widget.escena.nomEscena),
              actions: [
                CupertinoDialogAction(
                  child: Text("Editar"),
                  onPressed: () async{
                    Navigator.pop(context);
                    final resultat = await menuEditarEscena(context, widget.escena);
                    if (resultat != null){
                      setState(() {
                        widget.escena.nomEscena = resultat.nomEscena;
                        widget.escena.opcions = resultat.opcions;
                      });
                    }
                  }
                ),
                CupertinoDialogAction(
                  child: Text("Eliminar"),
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.eliminarEscena(widget.escena);
                    });
                  }
                ),
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  child: Text("Cancelar"),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          );
        }
      )
    );
  }
}