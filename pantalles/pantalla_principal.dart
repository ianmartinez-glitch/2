import 'package:applicacio_tr/components/dock.dart';
import 'package:applicacio_tr/core/colors_app.dart';
import 'package:applicacio_tr/core/text_styles.dart';
import 'package:applicacio_tr/pantalles/configuracio.dart';
import 'package:applicacio_tr/pantalles/control_veu.dart';
import 'package:applicacio_tr/pantalles/escenes.dart';
import 'package:applicacio_tr/pantalles/iluminacio.dart';
import 'package:applicacio_tr/pantalles/motors.dart';
import 'package:applicacio_tr/pantalles/seguretat.dart';
import 'package:flutter/cupertino.dart';


class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  int indexActual = 2;

  final List<String> titolsSeccions = ["Iluminació", "Motors", "Control per veu", "Seguretat", "Escenes"];
  final List<Widget> apartats = [Iluminacio(), Motors(), ControlVeu(), Seguretat(), Escenes()];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticBackgroundVisibility: false,
        backgroundColor: ColorsApp.secundari,
        middle: Text(titolsSeccions[indexActual], style: EstilText.textNegre,),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.ellipsis_circle, size: 25, color: ColorsApp.titol,),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => Configuracio())
            );
          }
        )
      ),
      child: Container(
        color: ColorsApp.fons,
        child: Stack(
          children: [
            Positioned.fill(
              child: Center(child: IndexedStack(index: indexActual, children: apartats))
            ),
            Dock(
              indexActual: indexActual,
              iconaSeleccionat: (index) {
                setState(() {
                  indexActual = index;
                });
              }
            )
          ],
        ),
      ),
    );
  }
}