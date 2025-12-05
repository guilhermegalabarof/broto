import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/dish.dart';
import '../../providers/dish_provider.dart';

class DishList extends ConsumerWidget {
  const DishList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dishes = ref.watch(dishProvider);

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: dishes.length,
      itemBuilder: (context, index) {
        final dish = dishes[index];
        return _DishCard(dish: dish);
      },
    );
  }
}

class _DishCard extends ConsumerWidget {
  final Dish dish;

  const _DishCard({required this.dish});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          context.push('/dishes/edit/${dish.id}');
        },
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  dish.name,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () => _showDeleteConfirmation(context, ref),
                tooltip: 'Delete dish',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDeleteConfirmation(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete dish?'),
        content: Text('Are you sure you want to delete "${dish.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      ref.read(dishProvider.notifier).removeDish(dish.id);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${dish.name} deleted'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
