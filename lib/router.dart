import 'package:go_router/go_router.dart';
import 'pages/home.dart';
import 'pages/dish/form.dart';

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
    GoRoute(
      path: '/dishes/edit/:id',
      builder: (context, state) {
        final dishId = state.pathParameters['id']!;
        return DishFormPage(dishId: dishId);
      },
    ),
  ],
);
