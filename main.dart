import 'package:applicacio_tr/pantalles/inici_sesio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: IniciSesio()
    );
  }
}