import 'package:flutter/material.dart';

class AppTextStyle extends TextStyle {
  const AppTextStyle.largeTitle({Color? color})
      : super(
          fontSize: 24,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w800,
          height: 1.362,
          color: color,
        );

  const AppTextStyle.boldTitle({Color? color})
      : super(
          fontSize: 20,
          fontFamily: "Poppins",
          fontWeight: FontWeight.bold,
          height: 1.362,
          color: color,
        );

  const AppTextStyle.intertitle({Color? color})
      : super(
          fontSize: 18,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
          height: 1.362,
          color: color,
        );

  const AppTextStyle.boldText({Color? color})
      : super(
          fontSize: 16,
          fontFamily: "Poppins",
          fontWeight: FontWeight.bold,
          height: 1.362,
          color: color,
        );

  const AppTextStyle.text({Color? color})
      : super(
          fontSize: 16,
          fontFamily: "Poppins",
          fontWeight: FontWeight.normal,
          height: 1.362,
          color: color,
        );

  const AppTextStyle.link({Color? color})
      : super(
          fontSize: 14,
          fontFamily: "Poppins",
          fontWeight: FontWeight.normal,
          height: 1.362,
          color: color,
        );

  const AppTextStyle.label({Color? color})
      : super(
          fontSize: 12,
          fontFamily: "Poppins",
          fontWeight: FontWeight.normal,
          height: 1.362,
          color: color,
        );

  static TextTheme buildTextTheme({Color? color}) {
    return TextTheme(
      headline1: AppTextStyle.largeTitle(color: color),
      headline2: AppTextStyle.boldTitle(color: color),
      headline4: AppTextStyle.intertitle(color: color),
      subtitle1: AppTextStyle.text(color: color),
      subtitle2: AppTextStyle.link(color: color),
      bodyText1: AppTextStyle.text(color: color),
      bodyText2: AppTextStyle.label(color: color),
      caption: AppTextStyle.label(color: color),
      button: AppTextStyle.text(color: color),
      overline: AppTextStyle.label(color: color),
    );
  }
}
