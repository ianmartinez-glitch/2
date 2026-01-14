import 'package:flutter/cupertino.dart';

class AlertaDialog extends StatefulWidget {
  const AlertaDialog({super.key});

  @override
  State<AlertaDialog> createState() => _AlertaDialogState();
}

class _AlertaDialogState extends State<AlertaDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      color: CupertinoColors.darkBackgroundGray.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Container(
          color: CupertinoColors.activeGreen,
          width: 100,
          height: 100,
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 100, horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton.filled(
                  child: Text("data"),
                  onPressed: ()=> Navigator.pop(context)
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}