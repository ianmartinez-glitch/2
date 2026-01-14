import 'package:applicacio_tr/core/colors_app.dart';
import 'package:applicacio_tr/serveis/comunicacio.dart';
import 'package:applicacio_tr/serveis/voice_control.dart';
import 'package:flutter/cupertino.dart';

class ControlVeu extends StatefulWidget {
  const ControlVeu({super.key});

  @override
  State<ControlVeu> createState() => _ControlVeuState();
}

class _ControlVeuState extends State<ControlVeu> {
  bool escoltant = false;
  bool potExecutar = false;
  String textReconegut = "";
  String textMostrat = "Esperant comando";

  final VoiceControl veu = VoiceControl();

  @override
  void initState() {
    super.initState();
    veu.initSpeech(); // Inicia el reconeixement de veu
  }

  void _quanReconegui(String text) {
    if(!escoltant) return;
    
    setState(() {
      textReconegut = text;
      textMostrat = text;
    });
  }

  List<String> detectarComandos(String text){
    final t = text.toLowerCase();

    final Map<String, List<String>> comandos ={
      "llum on": ["encén la llum", "encendre llum", "llum encesa", "llum on", "luz on"],
      "llum off": ["apaga la llum", "apagar llum", "llum apagada", "llum off", "luz of", "luz off"],
      "porta obrir": ["obre la porta", "obrir porta", "porta oberta"],
      "porta tancar": ["tancar la porta", "tancar porta", "porta tancada"]
    };
    List<String> detectats = [];
    comandos.forEach((ordre, frases) {
      for (final frase in frases){
        if(t.contains(frase)){
          detectats.add(ordre);
          break;
        }
      }
    });
    return detectats;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorsApp.fons2,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: ColorsApp.text,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              textMostrat,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                    if(potExecutar)...[
                      SizedBox(
                        width: double.infinity,
                        child: CupertinoButton.filled(
                          color: CupertinoColors.activeGreen,
                          child: Text("Executar comando"),
                          onPressed: (){
                            //Enviar comandos a Arduino per Bluetooth
                            setState(() {
                              potExecutar = false;
                              textMostrat = "Comando executat";
                            });
                            final comandos = detectarComandos(textReconegut);
                            for(final cmd in comandos){
                              enviarComando(cmd);
                            }
                          },  
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoButton.filled(
                        color: ColorsApp.primari,
                        child: Text(
                          escoltant ? "Atura" : "Prem per parlar",
                        ),
                        onPressed: () {
                          if (!escoltant){
                            //Comença a escoltar
                            setState(() {
                              escoltant = true;
                              textReconegut = "";
                              potExecutar = false;
                            });
                            veu.startListening(_quanReconegui);
                          } else{
                            //Aturar l'escolta
                            veu.stopListening();
                            final comandos = detectarComandos(textReconegut);
                            setState(() {
                              escoltant = false;
                              if (textReconegut.isEmpty || comandos.isEmpty){
                                //textReconegut = "";
                                textMostrat = "No s'ha pogut detectar cap comando";
                                potExecutar = false;
                              } else{
                                textMostrat = comandos.join(" | ");
                                potExecutar = true;
                              }
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
