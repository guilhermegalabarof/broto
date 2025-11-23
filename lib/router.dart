import 'package:go_router/go_router.dart';
import 'pages/home_page.dart';

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(title: 'Broto'),
    ),
  ],
);
