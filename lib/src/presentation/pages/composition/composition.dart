import 'dart:async';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_note/src/domain/entities/composition.dart';
import 'package:music_note/src/presentation/components/components.dart';
import 'package:music_note/src/presentation/theme/theme.dart';
import 'package:photo_view/photo_view.dart';

class CompositionPage extends StatefulWidget {
  CompositionPage({Key? key, required this.composition}) : super(key: key);

  CompositionEntity composition;

  @override
  _CompositionPageState createState() => _CompositionPageState();
}

class _CompositionPageState extends State<CompositionPage> {
  int progress = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (progress == 100) {
        timer.cancel();
        return;
      }

      setState(() => progress += 2);
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Widget _loading() {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: SvgPicture.asset("assets/icons/song.svg")),
        SizedBox(height: 20),
        Center(
          child: Text(
            "${widget.composition.title.toLowerCase().replaceAll(" ", "_")}.mp3",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: (screenSize.width * 0.1) / 2),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: AppTheme.borderRadiusMain,
            ),
            width: (screenSize.width * 0.9) * (progress * 0.01),
            height: 12.5,
          ),
        )
      ],
    );
  }

  Widget _note(String asset) {
    return GestureDetector(
      child: Image.asset(asset),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Container(
                  padding: AppTheme.horizontalPadding,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PhotoView(
                          tightMode: true,
                          disableGestures: true,
                          backgroundDecoration: BoxDecoration(color: Colors.transparent),
                          imageProvider: AssetImage(asset),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () => AutoRouter.of(context).pop(),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: AppTheme.borderRadiusMain,
                            ),
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                "Exit",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _loaded() {
    return Column(
      children: [
        SizedBox(height: 10),
        Padding(
          padding: AppTheme.horizontalPadding,
          child: CompositionCard(
            composition: widget.composition,
            suffixIcon: "assets/icons/menu.svg",
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: AppTheme.horizontalPadding,
              child: Row(
                children: [
                  _note("assets/images/note_1.png"),
                  SizedBox(width: 10),
                  _note("assets/images/note_1.png"),
                  SizedBox(width: 10),
                  _note("assets/images/note_1.png"),
                ],
              ),
            ),
          ),
        ),
        BottomPlayer(composition: widget.composition),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              pageName: "Music Note",
              onBack: progress != 100 ? null : () => AutoRouter.of(context).pop(),
            ),
            Expanded(
              child: progress != 100 ? _loading() : _loaded(),
            )
          ],
        ),
      ),
    );
  }
}
