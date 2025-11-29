import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/dish.dart';

class DishNotifier extends Notifier<List<Dish>> {
  @override
  List<Dish> build() {
    return [];
  }

  void addDish(Dish dish) {
    state = [...state, dish];
  }

  void removeDish(String id) {
    state = state.where((dish) => dish.id != id).toList();
  }

  void updateDish(String id, Dish updateDish) {
    state = [
      for (final dish in state)
        if (dish.id == id) updateDish else dish,
    ];
  }
}

final dishProvider = NotifierProvider<DishNotifier, List<Dish>>(() {
  return DishNotifier();
});
