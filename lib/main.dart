import 'package:flutter/material.dart';

import 'contact/affiche_contact.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Gestion de contact"),
            ),
            body: const Mescontacts()));
  }
}
