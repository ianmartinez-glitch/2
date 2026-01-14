import 'package:applicacio_tr/core/colors_app.dart';
import 'package:flutter/cupertino.dart';

class ControlMotor extends StatefulWidget {
  final String motors; 
  const ControlMotor({super.key, required this.motors});

  @override
  State<ControlMotor> createState() => _ControlMotorState();
}

class _ControlMotorState extends State<ControlMotor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsApp.fons2, 
        borderRadius: BorderRadius.circular(30)
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.motors,
              style: TextStyle(
                color: ColorsApp.text,
                fontSize: 40
              )
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CupertinoButton.filled(
                    color: ColorsApp.primari,
                    child: Icon(CupertinoIcons.left_chevron),
                    onPressed: (){}
                  ),
                  CupertinoButton.filled(
                    color: ColorsApp.primari,
                    child: Icon(CupertinoIcons.stop),
                    onPressed: (){}
                  ),
                  CupertinoButton.filled(
                    color: ColorsApp.primari,
                    child: Icon(CupertinoIcons.right_chevron),
                    onPressed: (){}
                  ),
                ],
              ),
            )
          ],
        )
      )
    );
  }
}