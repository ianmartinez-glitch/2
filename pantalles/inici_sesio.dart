import 'package:applicacio_tr/components/camp_text.dart';
import 'package:applicacio_tr/core/colors_app.dart';
import 'package:applicacio_tr/core/text_styles.dart';
import 'package:applicacio_tr/serveis/usuaris.dart';
import 'package:applicacio_tr/pantalles/pantalla_principal.dart';
import 'package:flutter/cupertino.dart';


class IniciSesio extends StatefulWidget {
  const IniciSesio({super.key});

  @override
  State<IniciSesio> createState() => _IniciSesioState();
}

class _IniciSesioState extends State<IniciSesio> {
  final TextEditingController controlUsuari = TextEditingController();
  final TextEditingController controlContrasenya = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: ColorsApp.fons,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Text("Benvingut de nou", style: EstilText.titol),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Text("Inici de sessió", style: EstilText.titol2),
              SizedBox(height: 20),
              CampText(
                titol: "USUARI",
                text: "Escriu el teu usuari",
                ocultat: false,
                control: controlUsuari
                ),
              SizedBox(height: 12),
              CampText(
                titol: "CONTRASENYA",
                text: "Escriu la teva contrasenya",
                ocultat: true,
                control: controlContrasenya
                
                ),
              SizedBox(height: 25),
              FractionallySizedBox(
                widthFactor: 0.75,
                child: CupertinoButton.filled(
                  color: ColorsApp.primari,
                  child: Text("ACCEDEIX-HI", style: EstilText.text2),
                  onPressed: (){
                    String usuari = controlUsuari.text;
                    String contrasenya = controlContrasenya.text;
                    controlUsuari.clear();
                    controlContrasenya.clear();

                    if(iniciarSesio(usuari, contrasenya)){
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => PantallaPrincipal())
                      );
                    }
                    else{
                      showCupertinoDialog(
                        context: context,
                        builder: (_) => CupertinoAlertDialog(
                          title: Text("Error", style: EstilText.textNegre),
                          content: Text("Usuari o contrasenya incorrectes."),
                          actions: [
                            CupertinoDialogAction(child: Text("Tanca"), onPressed: (){
                              Navigator.pop(context);
                            })
                          ]
                        )
                      );
                    }
                  }
                )
              )
            ]
          )
        )
      )
    );
  }
}