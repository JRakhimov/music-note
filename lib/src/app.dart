import 'package:flutter/material.dart';
import 'package:music_note/src/core/router/app_router.gr.dart';
import 'package:music_note/src/presentation/theme/theme.dart';

final _appRouter = AppRouter();

class MusicNoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "MusicNote",
      theme: AppTheme.theme,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
