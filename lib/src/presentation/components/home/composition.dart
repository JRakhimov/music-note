import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_note/src/domain/entities/composition.dart';
import 'package:music_note/src/presentation/theme/theme.dart';

class CompositionCard extends StatelessWidget {
  CompositionCard({
    Key? key,
    required this.composition,
    this.onTap,
    this.suffixIcon = "assets/icons/delete.svg",
  }) : super(key: key);

  CompositionEntity composition;
  VoidCallback? onTap;
  String suffixIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Row(
        children: [
          ClipRRect(
            child: Image.network(composition.imageUrl, width: 54, height: 54),
            borderRadius: AppTheme.borderRadiusMain,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(composition.title),
                SizedBox(height: 5),
                Text(
                  composition.artist,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          SvgPicture.asset(suffixIcon),
        ],
      ),
    );
  }
}
