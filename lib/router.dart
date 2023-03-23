import 'package:go_router/go_router.dart';
import 'package:web_test/main.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MyHomePage(),
    ),
  ],
);
