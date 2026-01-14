import 'package:applicacio_tr/components/control_motor.dart';
import 'package:flutter/cupertino.dart';

class Motors extends StatelessWidget {
  const Motors({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 50),
          ControlMotor(motors: "Porta"),
          SizedBox(height: 50),
          ControlMotor(motors: "Persiana")
        ]
      )
    );
  }
}