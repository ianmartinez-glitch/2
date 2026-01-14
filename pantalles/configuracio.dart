

import 'package:applicacio_tr/core/app_config.dart';
import 'package:applicacio_tr/core/colors_app.dart';
import 'package:applicacio_tr/core/text_styles.dart';
import 'package:applicacio_tr/pantalles/inici_sesio.dart';
import 'package:applicacio_tr/pantalles/pantalla_principal.dart';
import 'package:flutter/cupertino.dart';

class Configuracio extends StatefulWidget {
  const Configuracio({super.key});

  @override
  State<Configuracio> createState() => _ConfiguracioState();
}

class _ConfiguracioState extends State<Configuracio> {
  @override
  
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: ColorsApp.fons,
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              Icon(CupertinoIcons.back),
              Text("Enrerre")
            ],
          ),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => PantallaPrincipal())
            );
          }
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Text("Configuració", style: TextStyle(fontSize: 40, color: ColorsApp.text)),
            SizedBox(height: 20),
            CupertinoListSection.insetGrouped(
              backgroundColor: ColorsApp.fons,
              //Perfil
              children: [
                CupertinoListTile(
                  backgroundColor: ColorsApp.primari,
                  title: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: AssetImage("assets/imatges/perfil.png"),
                             fit: BoxFit.cover 
                            )
                          ),
                        )
                      ),
                      SizedBox(width: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Usuari 1", style: EstilText.text2),
                          SizedBox(height: 10),
                          Text("Edita el teu usuari", style: EstilText.text)
                        ],
                      )
                    ],
                  ),
                  trailing: CupertinoListTileChevron(),
                  onTap: (){}
                ),
                
              ],
            ),
            CupertinoListSection.insetGrouped(
              backgroundColor: ColorsApp.fons,
              children: [
                CupertinoListTile(
                  backgroundColor: ColorsApp.primari,
                  title: Row(
                    children: [
                      Icon(CupertinoIcons.question_circle),
                      SizedBox(width: 15),
                      Text("Ajuda", style: TextStyle(color: ColorsApp.text))
                    ],
                  ),
                  additionalInfo: Text("Guia de l'aplicació", style: TextStyle(color: ColorsApp.text)),
                  trailing: CupertinoListTileChevron(),
                  onTap: (){}
                ),
                CupertinoListTile(
                  backgroundColor: ColorsApp.primari,
                  title: Row(
                    children: [
                      Icon(CupertinoIcons.info),
                      SizedBox(width: 15),
                      Text("Informació", style: TextStyle(color: ColorsApp.text))
                    ]
                  ),
                  trailing: CupertinoListTileChevron(),
                  onTap: (){}
                ),
                CupertinoListTile(
                  backgroundColor: ColorsApp.primari,
                  title: Row(
                    children: [
                      Icon(CupertinoIcons.gear),
                      SizedBox(width: 15),
                      Text("Canviar la IP d'Arduino", style: TextStyle(color: ColorsApp.text))
                    ]
                  ),
                  trailing: CupertinoListTileChevron(),
                  onTap: (){
                    TextEditingController controller =
                    TextEditingController(text: ipArduino);

                    showCupertinoDialog(
                      context: context,
                      builder: (_) => CupertinoAlertDialog(
                        title: const Text("IP de l'Arduino"),
                        content: Column(
                          children: [
                            const SizedBox(height: 10),
                            CupertinoTextField(
                              controller: controller,
                              keyboardType: TextInputType.number,
                              placeholder: "192.168.1.156",
                            ),
                          ],
                        ),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () {
                              setState(() {
                                ipArduino = controller.text;
                              });
                              Navigator.pop(context);
                            },
                            child: const Text("Guardar"),
                          ),
                          CupertinoDialogAction(
                            onPressed: () => Navigator.pop(context),
                            isDestructiveAction: true,
                            child: const Text("Cancel·lar"),
                          ),
                        ],
                      ),
                    );
                  }
                ),
              ],
            ),

            CupertinoListSection.insetGrouped(
              backgroundColor: ColorsApp.fons,
              children: [
                CupertinoListTile(
                  backgroundColor: CupertinoColors.destructiveRed,
                  title: Center(
                    child: Text(
                      "Tancar sesió",
                      style: TextStyle(
                        color: ColorsApp.text, 
                      ),
                    )
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => IniciSesio())
                    );
                  },
                )
              ],
             ),
          ],
        ),
      )
    );
  }
}