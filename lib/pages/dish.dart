import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DishFormPage extends StatefulWidget {
  const DishFormPage({super.key});

  @override
  State<DishFormPage> createState() => _DishFormPage();
}

class _DishFormPage extends State<DishFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('New Dish')),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(child: Container(child: Text('data'))),
    );
  }
}
