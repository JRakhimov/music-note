import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageHeader extends StatelessWidget {
  PageHeader({Key? key, this.onBack, this.pageName}) : super(key: key);

  VoidCallback? onBack;
  String? pageName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, top: Platform.isAndroid ? 15.0 : 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (onBack != null)
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: onBack,
                child: SvgPicture.asset(
                  "assets/icons/back.svg",
                  height: 15,
                  width: 15,
                  color: Colors.black,
                ),
              ),
            )
          else
            Spacer(),
          if (pageName != null)
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  pageName!,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          Spacer()
        ],
      ),
    );
  }
}
