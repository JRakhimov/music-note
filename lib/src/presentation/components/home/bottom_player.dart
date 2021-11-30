import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_note/src/domain/entities/composition.dart';
import 'package:music_note/src/presentation/theme/theme.dart';

class BottomPlayer extends StatefulWidget {
  BottomPlayer({Key? key, required this.composition}) : super(key: key);

  CompositionEntity composition;

  @override
  _BottomPlayerState createState() => _BottomPlayerState();
}

class _BottomPlayerState extends State<BottomPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            color: Color(0xFFF7FAFF),
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 15),
            child: Row(
              children: [
                ClipRRect(
                  child: Image.network(widget.composition.imageUrl, width: 54, height: 54),
                  borderRadius: AppTheme.borderRadiusMain,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.composition.title),
                      SizedBox(height: 5),
                      Text(
                        widget.composition.artist,
                        style: TextStyle(
                          color: Color(0xFF8996B8),
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/prev.svg"),
                    SizedBox(width: 25),
                    SvgPicture.asset("assets/icons/pause.svg"),
                    SizedBox(width: 25),
                    SvgPicture.asset("assets/icons/next.svg"),
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Colors.black,
            height: 5,
            width: 150,
          ),
        ],
      ),
    );
  }
}
