import 'package:go_router/go_router.dart';
import 'package:tkgapp/src/views/pages/detail_page.dart';
import 'package:tkgapp/src/views/pages/login_page.dart';
import 'package:tkgapp/src/router/router_path.dart';
import 'package:tkgapp/src/views/pages/top_page.dart';

final router = GoRouter(
  initialLocation: RouterPath.index,
  routes: [
    GoRoute(
      path: RouterPath.index,
      name: RouterPath.index,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RouterPath.top,
      name: RouterPath.top,
      builder: (context, state) => const TopPage(),
    ),
    GoRoute(
      path: '${RouterPath.detail}/:code',
      name: RouterPath.detail,
      builder: (context, state) {
        final code = state.pathParameters['code']!;
        return DetailPage(code: code);
      },
    ),
  ],
);
