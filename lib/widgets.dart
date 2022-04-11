import 'package:flutter/material.dart';

Widget appBtn(Color txtColor, Color btnColor, String btnTxt, Function? onPress, {
  double fontSize = 16,
  double borderWidth = 1,
  FontWeight wt = FontWeight.normal,
  double radius = 5,
  Color borderColor = Colors.transparent,
  double elev = 0,
  TextOverflow textOverflow = TextOverflow.visible
}) {
  return ElevatedButton(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(elev),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(color: borderColor, width: borderWidth)
          )
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          }
          return btnColor;
        }),
    ),
    onPressed: onPress == null ? null : () => onPress(),
    child: Text(btnTxt,
      overflow: textOverflow,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: wt, color: txtColor, fontSize: fontSize)
    ),
  );
}