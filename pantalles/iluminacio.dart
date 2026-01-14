import 'package:applicacio_tr/components/cercle_cromatic.dart';
import 'package:applicacio_tr/components/lliscador_intensitat.dart';
import 'package:applicacio_tr/components/paleta_colors.dart';
import 'package:applicacio_tr/core/colors_app.dart';
import 'package:flutter/cupertino.dart';

class Iluminacio extends StatefulWidget {
  const Iluminacio({super.key});

  @override
  State<Iluminacio> createState() => _IluminacioState();
}

class _IluminacioState extends State<Iluminacio> {
  final List<String> modes = ["Automàtic", "Manual"];
  int modeSeleccionat = 0;
  Color color = Color(0xFFFFFFFF);
  bool intensitatManual = false;
  
  void rebreColor(Color colorRebut){
    setState(() {
      color = colorRebut;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
              color: ColorsApp.fons2, 
              borderRadius: BorderRadius.circular(30)
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CercleCromatic(colorCercle: color, enCanviarColor: rebreColor),
                  SizedBox(height: 30),
                  PaletaColors(enPremerColor: rebreColor, colorActual: color)
                ],
              ),
            ),
          ),
          SizedBox(height: 35),
          SizedBox(
            child: Container(
              decoration: BoxDecoration(
                color: ColorsApp.fons2, 
                borderRadius: BorderRadius.circular(30)
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    if(intensitatManual == true)...[
                      LliscadorIntensitat(),
                      SizedBox(height: 20)
                    ],
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoButton.filled(
                        color: ColorsApp.primari,
                        child:Text(intensitatManual
                          ? "Intensitat Automàtica"
                          : "Intensitat Manual",
                          style: TextStyle(color: ColorsApp.text),
                        ),
                        onPressed: ()=> setState(() =>intensitatManual = !intensitatManual)
                      ),
                    )
                    //BotoIntensitat(modeActual: modeSeleccionat, llegirMode: rebreMetode),
                    
                  ],
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}