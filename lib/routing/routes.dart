import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test/home/detail_provider.dart';
import 'package:test/home/home_provider.dart';
import 'package:test/settings/settings_page.dart';
import 'package:test/settings/settings_provider.dart';
import 'package:test/tab_page_2.dart';

import '../home/detail_page.dart';
import '../home/home_page.dart';

class Routes {
  late GoRouter router;

  Routes() {
    router = GoRouter(
      routes: [
        ShellRoute(
          builder: (context, state, child) =>
              TabPage(pageName: state.name ?? '', child: child),
          routes: [
            GoRoute(
              name: HomePage.routeName,
              path: '/',
              builder: (context, state) => ChangeNotifierProvider(
                create: (_) => HomeProvider(),
                child: const HomePage(),
              ),
            ),
            GoRoute(
              name: SettingsPage.routeName,
              path: '/settings',
              builder: (context, state) => ChangeNotifierProvider(
                create: (_) => SettingsProvider(),
                child: const SettingsPage(),
              ),
            ),
          ],
        ),
        GoRoute(
          name: DetailPage.routeName,
          path: '/detail',
          builder: (context, state) {
            if (state.extra == null) {
              throw Exception();
            }
            final param = state.extra as Map<String, dynamic>;
            return ChangeNotifierProvider(
              create: (_) => DetailsProvider(),
              child: DetailPage(orgNum: param['orgNum'], name: param['name']),
            );
          },
        ),
      ],
    );
  }
}
