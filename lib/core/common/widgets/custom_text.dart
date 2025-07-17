import 'package:flutter/material.dart';

Widget customText({required String textString, int? maxLines, double? fontSize, Color? textColor, FontWeight? fontWeight}) {
  return Text(
    textString,
    softWrap: true,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight,
    ),
  );
}