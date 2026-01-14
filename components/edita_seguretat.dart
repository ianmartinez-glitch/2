import 'package:applicacio_tr/core/colors_app.dart';
import 'package:flutter/cupertino.dart';

class EditaSeguretat extends StatefulWidget {
  const EditaSeguretat({super.key});

  @override
  State<EditaSeguretat> createState() => _EditaSeguretatState();
}

class _EditaSeguretatState extends State<EditaSeguretat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsApp.fons2, 
        borderRadius: BorderRadius.circular(30)
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("data")
          ]
        )
      )
    );
  }
}