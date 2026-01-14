import 'package:applicacio_tr/components/boto_crear_escena.dart';
import 'package:applicacio_tr/components/boto_escena.dart';
import 'package:applicacio_tr/components/menu_editar_escena.dart';
import 'package:applicacio_tr/core/colors_app.dart';
import 'package:flutter/cupertino.dart';


class Escenes extends StatefulWidget {
  const Escenes({super.key});

  @override
  State<Escenes> createState() => _EscenesState();
}

class _EscenesState extends State<Escenes> {
  void eliminarEscena(Informacio escena){
    setState(() {
      escenes.remove(escena);
    });
  }
  void afegirEscena(Informacio novaEscena){
    setState(() {
      escenes.add(novaEscena);
    });
  }
  
  List<Informacio> escenes = [
    Informacio(
      nomEscena: "Entrar",
      opcions: {
        "Encendre llums": true, "Intensitat automatica": false,
        "Alarma activada": false, "Obrir porta": true, "Tancar porta": false,
        "Pujar persiana": true, "Baixar persiana": false
      }
    ),
    Informacio(
      nomEscena: "Sortir",
      opcions: {
        "Llum": false, "Intensitat automatica": false,
        "Alarma": true, "Obrir porta": false, "Tancar porta": true,
        "Pujar persiana": true, "Baixar persiana": false
      }
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              color: ColorsApp.fons2, 
              borderRadius: BorderRadius.circular(30)
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...escenes.take(3).map((escena) {
                        return BotoEscena(
                          escena: escena,
                          eliminarEscena: eliminarEscena
                        );
                      }),
                      if (escenes.length < 3) BotoCrearEscena(afegirEscena: afegirEscena)
                    ]
                  ),
                  if (escenes.length > 2) SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...escenes.skip(3).take(3).map((escena) {
                      return BotoEscena(
                        escena: escena,
                        eliminarEscena: eliminarEscena
                        );
                      }),
                      if (escenes.length >= 3 && escenes.length <= 5)
                        BotoCrearEscena(afegirEscena: afegirEscena)
                    ]
                  ),
                  if (escenes.length > 5) SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...escenes.skip(6).map((escena) {
                      return BotoEscena(
                        escena: escena,
                        eliminarEscena: eliminarEscena
                        );
                      }),
                      if (escenes.length >= 6 && escenes.length < 9)
                        BotoCrearEscena(afegirEscena: afegirEscena)
                    ]
                  )
                ]
              )
            )
          )
        ]
      )
    );
  }
}