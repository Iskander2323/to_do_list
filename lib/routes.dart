import 'package:go_router/go_router.dart';
import 'package:test_project/components/form_to_do/ui/form_bloc.dart';
import 'package:test_project/components/todo/ui/home_page.dart';

final GoRouter routes = GoRouter(initialLocation: '/home', routes: <RouteBase>[
  GoRoute(
      path: '/home',
      builder: (context, state) => const ToDoListPage(),
      routes: <RouteBase>[
        GoRoute(
          name: 'FormFields',
          path: 'form_fields',
          builder: (context, state) => const FormBlocPage(),
        )
      ])
]);
