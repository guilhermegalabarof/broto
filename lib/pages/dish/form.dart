import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/dish_provider.dart';
import '../../models/dish.dart';

class DishFormPage extends ConsumerStatefulWidget {
  const DishFormPage({super.key});

  @override
  ConsumerState<DishFormPage> createState() => _DishFormPage();
}

class _DishFormPage extends ConsumerState<DishFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose(); //this is a cleanup
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newDish = Dish(name: _nameController.text);
      print('name: ${_nameController.text}');
      ref.read(dishProvider.notifier).addDish(newDish);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Dish added!')));

      context.pop();
    }
  }

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              crossAxisAlignment: .center,

              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: 'Name of dish'),
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: _submitForm, child: Text('Salvar')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
