import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test/core/detail_provider.dart';
import 'package:test/core/home_provider.dart';

import '../core/detail_page.dart';
import '../core/home_page.dart';

class Routes {
  late GoRouter router;

  Routes() {
    router = GoRouter(
      routes: [
        GoRoute(
          name: 'home',
          path: '/',
          builder: (context, state) => ChangeNotifierProvider(
            create: (_) => HomeProvider(),
            child: const HomePage(),
          ),
        ),
        GoRoute(
            name: 'detail',
            path: '/detail',
            builder: (context, state) {
              if (state.extra == null) {
                throw Exception();
              }
              final param = state.extra as Map<String, dynamic>;
              return ChangeNotifierProvider(
                  create: (_) => DetailsProvider(),
                  child:
                      DetailPage(orgNum: param['orgNum'], name: param['name']));
            }),
      ],
    );
  }
}
