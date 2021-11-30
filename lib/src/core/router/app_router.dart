import 'package:auto_route/auto_route.dart';
import 'package:music_note/src/presentation/pages/composition/composition.dart';
import 'package:music_note/src/presentation/pages/home/home.dart';
import 'package:music_note/src/presentation/pages/launcher.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LauncherPage, initial: true),
    AutoRoute(page: HomePage),
    AutoRoute(page: CompositionPage),
  ],
)
class $AppRouter {}
