import 'package:flutter/material.dart';

class DishFormPage extends StatefulWidget {
  const DishFormPage({super.key});

  @override
  State<DishFormPage> createState() => _DishFormPage();
}

class _DishFormPage extends State<DishFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: Text('data'))),
    );
  }
}
