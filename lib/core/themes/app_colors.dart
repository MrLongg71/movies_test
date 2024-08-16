import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xff1D9BF0);
  static const Color secondaryColor = Color(0xffF0761D);
  static const primaryBackground = Color(0xff1a1d1f);
  static const secondaryBackground = Color(0xff272b30);
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
  static const ratingIconColor = Color(0xffffbe21);

  static const Color greenColor = Color(0xff36C31F);
  static const Color blueLight = Color(0xffCAE2FF);

  static const Color facebookColor = Color(0xff1877F2);

  static const Color transparent = Colors.transparent;

  static const Color iconContainerColor = Color(0xB2272830);

  static const Color circleDotColor = Color(0x33ffffff);

  static final LinearGradient premiumBackground = LinearGradient(
    colors: [
      AppColors.secondaryColor.withOpacity(0.9),
      AppColors.primaryColor,
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
}
