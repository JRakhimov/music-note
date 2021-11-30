import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_note/src/core/router/app_router.gr.dart';
import 'package:music_note/src/domain/data/data.dart';
import 'package:music_note/src/presentation/components/components.dart';
import 'package:music_note/src/presentation/theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _uploadAudio() {
    return Container(
      color: Color(0xFFF8F8F8),
      height: 185,
      width: double.infinity,
      child: DottedBorder(
        dashPattern: [6, 4],
        padding: EdgeInsets.all(15),
        color: Colors.grey,
        borderType: BorderType.RRect,
        radius: AppTheme.radiusCircularMain,
        child: ClipRRect(
          borderRadius: AppTheme.borderRadiusMain,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/upload.svg", width: 30),
                SizedBox(height: 20),
                Text(
                  "Upload your piano audio",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFF9E9E9E),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(pageName: "Music Note"),
            SizedBox(height: 10),
            Padding(
              padding: AppTheme.horizontalPadding,
              child: _uploadAudio(),
            ),
            SizedBox(height: 24),
            Padding(
              padding: AppTheme.horizontalPadding,
              child: Text("History", style: Theme.of(context).textTheme.bodyText1),
            ),
            SizedBox(height: 12),
            Expanded(
              child: Padding(
                padding: AppTheme.horizontalPadding,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < TempData.compositions.length; i++) ...[
                        CompositionCard(
                          composition: TempData.compositions[i],
                          onTap: () => AutoRouter.of(context).push(
                            CompositionRoute(composition: TempData.compositions[i]),
                          ),
                        ),
                        if (i != TempData.compositions.length - 1) SizedBox(height: 24),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            BottomPlayer(),
          ],
        ),
      ),
    );
  }
}
