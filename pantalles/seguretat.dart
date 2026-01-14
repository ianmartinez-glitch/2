import 'package:applicacio_tr/core/colors_app.dart';
import 'package:flutter/cupertino.dart';

class Seguretat extends StatefulWidget {
  const Seguretat({super.key});

  @override
  State<Seguretat> createState() => _SeguretatState();
}

class _SeguretatState extends State<Seguretat> {
  bool alarma = true;
  bool _edita = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        children: [
          CupertinoListSection.insetGrouped(
            backgroundColor: ColorsApp.fons,
            children: [
              CupertinoListTile(
                backgroundColor: ColorsApp.primari,
                title: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.lock_shield,
                        size: 150,
                        color: alarma
                          ? ColorsApp.text
                          : CupertinoColors.destructiveRed
                      ),
                      SizedBox(width: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sistema"),
                          Text(alarma ? "Connectat" : "Desconectat")
                        ],
                      )
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    alarma = !alarma;
                  });
                },
              ),
              Container(
                color: ColorsApp.primari,
                child: Row(
                  children: [
                    Expanded(
                      child: CupertinoButton.filled(
                        color: ColorsApp.primari, 
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.gear, color: ColorsApp.text),
                            SizedBox(width: 20),
                            Text("Edita", style: TextStyle(color: ColorsApp.text),),
                            Expanded(child: SizedBox()),
                            Icon( _edita ? CupertinoIcons.chevron_down : CupertinoIcons.chevron_up)
                          ],
                        ),
                        onPressed: (){
                          if(_edita == false) {setState(() => _edita = true);}
                          else {setState(() => _edita = false);}
                        }
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CupertinoButton.filled(
                        color: ColorsApp.primari,
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.exclamationmark_triangle_fill, color: ColorsApp.text),
                            SizedBox(width: 20),
                            Text("Pànic", style: TextStyle(color: ColorsApp.text),),
                            Expanded(child: SizedBox())
                            
                          ]
                        ),
                        onPressed: (){
                          showCupertinoDialog(
                            context: context,
                            builder: (_) => CupertinoAlertDialog(
                              title: Text("Introdueix el codi"),
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CupertinoTextField(
                                  //controller: ,
                                  placeholder: "hola",
                                  obscureText: true,
                                ),
                              ),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text("Confirmar"),
                                  onPressed: (){
                                    //Navigator.pop(context);
                                    //setState(() => _edita = true);
                                  },
                                ),
                                CupertinoDialogAction(
                                  isDestructiveAction: true,
                                  child: Text("Cancelar"),
                                  onPressed: () {
                                    //setState(() => _edita = false);
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            )
                          );  
                        },
                        onLongPress: (){}
                      )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]
      )
    );
  }
}