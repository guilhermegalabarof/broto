import 'package:uuid/uuid.dart';

class Dish {
  Dish._({required this.name, required this.id});

  factory Dish({required String name}) {
    return Dish._(id: const Uuid().v4(), name: name);
  }

  Dish.fromDatabase({required this.name, required this.id});

  final String name;
  final String id;

  @override
  String toString() {
    return 'Dish(id: $id, name: $name)';
  }
}
