import 'package:broto/providers/dish_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerStatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final dishes = ref.watch(dishProvider);

    debugPrint('dishes: $dishes');

    return Scaffold(
      body: dishes.isNotEmpty
          ? Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1,
                    ),
                    itemCount: dishes.length,
                    itemBuilder: (context, index) {
                      final dish = dishes[index];
                      return Card(elevation: 4, child: Text(dish.name));
                    },
                  ),
                ),
                _buildCreateButton(context),
              ],
            )
          : Center(
              child: Column(
                children: [
                  Text('Start by adding a meal'),
                  _buildCreateButton(context),
                ],
              ),
            ),
    );
  }

  ElevatedButton _buildCreateButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.push('/dishes/new');
      },
      child: Text('Create new dish'),
    );
  }
}
