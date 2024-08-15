import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xff1D9BF0);
  static const Color secondaryColor = Color(0xffF0761D);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color blackColor = Color(0xff000000);
  static const Color disableColor = Color(0xffABABAB);
  static const Color borderColor = Color(0xffDCE1E9);
  static const Color disableTextColor = Color(0xffCED0D1);
  static const Color neutralPrimaryColor = Color(0xff072539);
  static const Color neutralSecondColor = Color(0xff3C495C);
  static const Color neutralBodyColor = Color(0xff61697C);
  static const Color neutralCaptionColor = Color(0xffA1A8B5);
  static const Color dividerColor = Color(0xffECF2FA);
  static const Color bgNeutralColor = Color(0xffF7F9FD);
  static const Color bgBlueColor = Color(0xffF5FCFF);
  static const Color bgYellowColor = Color(0xffFFEC89);

  static const Color redColor = Color(0xffED3E32);
  static const Color blueColor = Color(0xff0068E2);
  static const Color yellowColor = Color(0xffFFC700);
  static const Color yellowLightColor = Color(0xffFFEC89);
  static const Color greenColor = Color(0xff36C31F);
  static const Color blueLight = Color(0xffCAE2FF);

  static const Color facebookColor = Color(0xff1877F2);

  static final LinearGradient premiumBackground = LinearGradient(
    colors: [
      AppColors.secondaryColor.withOpacity(0.9),
      AppColors.primaryColor,
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static const LinearGradient countingBackground = LinearGradient(
    colors: [
      Color(0xffF83600),
      Color(0xffFE8C00),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient countBackground = LinearGradient(
    colors: [
      Color(0xff0052D4),
      Color(0xff5DBEFF),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

final listColorShirt = <Color>[
  HexColor('FFFFFF'),
  HexColor('000000'),
  HexColor('E76363'),
  HexColor('51C0FF'),
  HexColor('7451FF'),
  HexColor('DC51FF'),
  HexColor('FFA451'),
];
