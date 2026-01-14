import 'package:flutter/cupertino.dart';

class Informacio {
  String nomEscena;
  Map<String, bool> opcions;

  Informacio({required this.nomEscena, required this.opcions});
}

Future<Informacio?> menuEditarEscena(
  BuildContext context,
  Informacio? escena,
) async {
  bool escenaNova = escena == null;
  String nomEscenaTemporal = escenaNova ? "Nova escena" : escena.nomEscena;
  Map<String, bool> opcionsTemporals = escenaNova
    ?{
      "Encendre llums": false, "Intensitat automatica": false,
      "Alarma activada": false, "Obrir porta": false, "Tancar porta": false,
      "Pujar persiana": false, "Baixar persiana": false
    }
    : Map.from(escena.opcions);

  return await showCupertinoDialog<Informacio>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setStateDialog) {
          return CupertinoPopupSurface(
            child: CupertinoAlertDialog(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(escenaNova ? "Crear escena" : "Editar escena"),
                    SizedBox(height: 8),
                    CupertinoTextField(
                      placeholder: "Nom de la escena",
                      maxLength: 20,
                      controller: TextEditingController(text: nomEscenaTemporal),
                      onChanged: (text){
                        nomEscenaTemporal = text;
                      },
                    ),
                  ],
                ),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: opcionsTemporals.keys.map((opcio) {
                    return Row(
                      children: [
                        Text(opcio),
                        Expanded(child: SizedBox()),
                        CupertinoSwitch(
                          value: opcionsTemporals[opcio]!,
                            onChanged: (bool valor) {
                              setStateDialog(() {
                                opcionsTemporals[opcio] = valor;
                              });
                            },
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                actions: [
                  CupertinoDialogAction(
                  isDestructiveAction: true,
                  child: Text("Cancelar"),
                    
                  onPressed: () => Navigator.pop(context, null),
                ),
                CupertinoDialogAction(
                  child: Text("Aceptar"),
                  onPressed: () {
                    Navigator.pop(
                      context,
                      Informacio(nomEscena: nomEscenaTemporal, opcions: opcionsTemporals),
                    );
                  },
                ),
                ],
              ),
          );
        }
      );
    }
  );
}
