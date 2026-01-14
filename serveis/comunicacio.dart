import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> enviarComando(String cmd) async {
  try {
    final url = Uri.parse(
      'http://192.168.1.156/command?cmd=$cmd',
    );
    final response = await http.get(url);

    debugPrint(response.body);
  } catch (e) {
    debugPrint('Error: $e');
  }
}