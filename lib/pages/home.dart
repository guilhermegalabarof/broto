import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/dish_provider.dart';
import 'dish/list.dart';

class HomePage extends ConsumerWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dishes = ref.watch(dishProvider);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: dishes.isNotEmpty
          ? const DishList() // Use the extracted list component
          : _buildEmptyState(context),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/dishes/new'),
        icon: const Icon(Icons.add),
        label: const Text('New Dish'),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.restaurant_menu, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No dishes yet',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            'Start by adding your first dish',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
