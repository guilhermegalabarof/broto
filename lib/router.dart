import 'package:go_router/go_router.dart';
import 'pages/home.dart';
import 'pages/dish.dart';

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(title: 'Broto'),
    ),
    GoRoute(
      path: '/dishes/new',
      builder: (context, state) => const DishFormPage(),
    ),
  ],
);
