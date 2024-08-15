import 'package:flutter/material.dart';

import 'app_colors.dart';

class Header1 extends TextStyle {
  Header1({
    double? fontSize = 32,
    Color? color = AppColors.neutralPrimaryColor,
    double? height = 1.2,
    FontWeight? fontWeight = FontWeight.w700,
    String? locale,
  }) : super(
          fontSize: fontSize,
          color: color,
          height: height,
          fontWeight: fontWeight,
        );
}

class Header2 extends TextStyle {
  const Header2({
    super.fontSize = 24,
    super.color = AppColors.neutralPrimaryColor,
    super.height = 1.2,
    super.fontWeight = FontWeight.w700,
    String? locale,
  });
}

class Header3 extends TextStyle {
  Header3({
    double? fontSize = 20,
    Color? color = AppColors.neutralPrimaryColor,
    double? height = 1.2,
    FontWeight? fontWeight = FontWeight.w700,
    String? locale,
  }) : super(
          fontSize: fontSize,
          color: color,
          height: height,
          fontWeight: fontWeight,
        );
}

class Sub1 extends TextStyle {
  Sub1({
    double? fontSize = 16,
    Color? color = AppColors.neutralPrimaryColor,
    double? height = 1.2,
    FontWeight? fontWeight = FontWeight.w700,
    String? locale,
  }) : super(
          fontSize: fontSize,
          color: color,
          height: height,
          fontWeight: fontWeight,
        );
}

class Sub2 extends TextStyle {
  Sub2({
    double? fontSize = 14,
    Color? color = AppColors.neutralPrimaryColor,
    double? height = 1.4,
    FontWeight? fontWeight = FontWeight.w700,
    String? locale,
  }) : super(
          fontSize: fontSize,
          color: color,
          height: height,
          fontWeight: fontWeight,
        );
}

class Sub3 extends TextStyle {
  Sub3({
    double? fontSize = 12,
    Color? color = AppColors.neutralPrimaryColor,
    double? height = 1.2,
    FontWeight? fontWeight = FontWeight.w700,
    String? locale,
  }) : super(
          fontSize: fontSize,
          color: color,
          height: height,
          fontWeight: fontWeight,
        );
}

class Para1 extends TextStyle {
  Para1({
    double? fontSize = 14,
    Color? color = AppColors.neutralPrimaryColor,
    double? height = 1.4,
    FontWeight? fontWeight = FontWeight.w400,
    String? locale,
  }) : super(
          fontSize: fontSize,
          color: color,
          height: height,
          fontWeight: fontWeight,
        );
}

class Para2 extends TextStyle {
  Para2({
    double? fontSize = 12,
    Color? color = AppColors.neutralPrimaryColor,
    double? height = 1.4,
    FontWeight? fontWeight = FontWeight.w400,
    String? locale,
  }) : super(
          fontSize: fontSize,
          color: color,
          height: height,
          fontWeight: fontWeight,
        );
}

class Caption1 extends TextStyle {
  Caption1({
    double? fontSize = 10,
    Color? color = AppColors.neutralPrimaryColor,
    double? height = 1.4,
    FontWeight? fontWeight = FontWeight.w700,
    String? locale,
  }) : super(
          fontSize: fontSize,
          color: color,
          height: height,
          fontWeight: fontWeight,
        );
}

class Caption2 extends TextStyle {
  Caption2({
    double? fontSize = 10,
    Color? color = AppColors.neutralPrimaryColor,
    double? height = 1.2,
    FontWeight? fontWeight = FontWeight.w400,
    String? locale,
  }) : super(
          fontSize: fontSize,
          color: color,
          height: height,
          fontWeight: fontWeight,
        );
}

class TitleButton extends TextStyle {
  TitleButton({
    double? fontSize = 8,
    Color? color = AppColors.neutralPrimaryColor,
    double? height = 1.3,
    FontWeight? fontWeight = FontWeight.w400,
    String? locale,
  }) : super(
          fontSize: fontSize,
          color: color,
          height: height,
          fontWeight: fontWeight,
        );
}

class ButtonTextStyle extends TextStyle {
  ButtonTextStyle({
    double? fontSize = 14,
    Color? color = AppColors.neutralPrimaryColor,
    double? height = 1.2,
    FontWeight? fontWeight = FontWeight.w700,
    String? locale,
  }) : super(
          fontSize: fontSize,
          color: color,
          height: height,
          fontWeight: fontWeight,
        );
}
