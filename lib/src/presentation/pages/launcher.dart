import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:music_note/src/core/router/app_router.gr.dart';

class LauncherPage extends StatefulWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1500)).then(
      (value) => AutoRouter.of(context).replace(HomeRoute()),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Music Note",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
