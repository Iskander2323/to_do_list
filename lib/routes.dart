import 'package:go_router/go_router.dart';
import 'package:test_project/components/home_page.dart';

final GoRouter routes = GoRouter(initialLocation: '/', routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (context, state) => ToDoListPage(),
  )
]);
