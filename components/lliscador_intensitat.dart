import 'package:applicacio_tr/core/colors_app.dart';
import 'package:flutter/cupertino.dart';

class LliscadorIntensitat extends StatefulWidget {
  const LliscadorIntensitat({super.key});

  @override
  State<LliscadorIntensitat> createState() => _LliscadorIntensitatState();
}

class _LliscadorIntensitatState extends State<LliscadorIntensitat> {
  double intensitat = 255;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          if(intensitat < 125) Icon(CupertinoIcons.brightness, color: ColorsApp.text)
          else Icon(CupertinoIcons.brightness_solid, color: ColorsApp.text),
          Expanded(
            child: CupertinoSlider(
              min: 0,
              max: 255,
              divisions: 255,
              value: intensitat,
              onChanged: (val){
                setState(() {
                  intensitat = val;
                });
              },
              activeColor: ColorsApp.secundari,
              thumbColor: ColorsApp.text,
            ),
          ),
          SizedBox(width: 10),
          Text("${(intensitat * 100/255).toStringAsFixed(0)} %", style: TextStyle(color: ColorsApp.text),)
        ],
      ),
    );
  }
}