import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class Constants {
  List<String> assetsImages = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
    'assets/7.png',
    'assets/8.png',
    'assets/9.png',
    'assets/10.png',
    'assets/11.png',
    'assets/12.png',
    'assets/13.png',
    'assets/14.png',
    'assets/15.png',
    'assets/16.png',
  ];

  showDialogWinner(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Muito bem você conseguiu'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Parar'),
            child: const Text(
              'Desisto',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              html.window.location.reload();
              Navigator.pop(context, 'Tentar de Novo');
            },
            child: const Text('Jogar de Novo',
                style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}
