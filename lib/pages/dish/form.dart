import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/dish_provider.dart';
import '../../models/dish.dart';

class DishFormPage extends ConsumerStatefulWidget {
  final String? dishId;

  const DishFormPage({super.key, this.dishId});

  @override
  ConsumerState<DishFormPage> createState() => _DishFormPage();
}

class _DishFormPage extends ConsumerState<DishFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  Dish? _dishToEdit;

  @override
  void initState() {
    super.initState();
    if (widget.dishId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final dishes = ref.read(dishProvider);
        _dishToEdit = dishes.firstWhere(
          (dish) => dish.id == widget.dishId,
          orElse: () => throw Exception('Dish not found'),
        );
        _nameController.text = _dishToEdit!.name;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  bool get _isEditMode => widget.dishId != null;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final dishName = _nameController.text;

      if (_isEditMode) {
        final updatedDish = Dish.fromDatabase(
          id: widget.dishId!,
          name: dishName,
        );
        ref.read(dishProvider.notifier).updateDish(widget.dishId!, updatedDish);

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Dish updated!')));
      } else {
        // Create new dish
        final newDish = Dish(name: dishName);
        ref.read(dishProvider.notifier).addDish(newDish);

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Dish added!')));
      }

      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isEditMode ? 'Edit Dish' : 'New Dish')),
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
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(_isEditMode ? 'Update' : 'Create'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
