import 'package:flutter/material.dart';

class AppColors {
  static const int _primaryColorValue = 0xFF240DFF;

  ///primarySwatch [must] contain all shades(50-900).
  static const primaryColor = MaterialColor(0xFFB0CC3A, {
    50: Color(0xFFF9FBE7),
    100: Color(0xFFF0F4C3),
    200: Color(0xFFE6EE9C),
    300: Color(0xFFDCE775),
    400: Color(0xFFD4E157),
    500: Color(0xFFCDDC39),
    600: Color(0xFFC0CA33),
    700: Color(0xFFAFB42B),
    800: Color(0xFF9E9D24),
    900: Color(0xFF827717),
  });
  
  static const redColor = MaterialColor(0xFFEE4439, {
    50: Color(0xFFFFEBEE),
    100: Color(0xFFFFCDD2),
    200: Color(0xFFEF9A9A),
    300: Color(0xFFE57373),
    400: Color(0xFFEF5350),
    500: Color(0xFFF44336),
    600: Color(0xFFE53935),
    700: Color(0xFFD32F2F),
    800: Color(0xFFC62828),
    900: Color(0xFFB71C1C),
  });

  static const accentColor = MaterialColor(0xFFFFD107, {
    50: Color(0xFFFFF8E1),
    100: Color(0xFFFFECB3),
    200: Color(0xFFFFE082),
    300: Color(0xFFFFD54F),
    400: Color(0xFFFFCA28),
    500: Color(0xFFFFC107),
    600: Color(0xFFFFB300),
    700: Color(0xFFFFA000),
    800: Color(0xFFFF8F00),
    900: Color(0xFFFF6F00),
  });

  //static const primaryColor = Color(0xFFED3675);
  static const primaryAccentColor = Color(0xFF883C90);
  static const primaryLiteColor = Color(0xFF563078);
  static const secondaryColor = Color(0xFFED3675);
  static const backgroundColor = Color(0xFFF6F9FF);
  //static const accentColor = Color(0xFF703E97);
  static const transparent = Color(0x00bd4efe);
  static final transparentPure = Colors.white.withOpacity(0.0);

  ///Core Color
  static const coreWidgetColor = Color(0xFF533F5A);

  static const textColorGrey = Color(0xFF7E7E7E);
  static const textColorLiteGreen = Color(0xFF179848);
  static const textLiteGrey = Color(0xFF6A6A6A);
  static const liteBorderColor = Color(0xFFEEEEEE);
  static const tableHeaderColor = Color(0xFFF8F8F8);

  static const flightFilterSelectedColor = Color(0xFF703E97);
  //text color
  static const textColor = Color(0xFF533E5A);
  static const textGray = Color(0xFF626262);
  static const textGreen = Color(0xFF009A48);
  static const textYellow = Color(0xFFFFA800);
  static const textRed = Color(0xFFFF001D);
  static const textDeepBlue = Color(0xFF002952);
  static const textBlue = Color(0xFF0054A6);

  static const dividerColor = Color(0xFFE5ECF9);

  static const purple = Color(0xFF5C3BFF);
  static const purpleDark = Color(0xFF000F9A);
  static const black = Color(0xFF091C32);
  static const blackPure = Color(0xFF000000);
  static const white = Color(0xFFF8F8F8);
  static const whitePure = Color(0xFFFFFFFF);
  static const gray = Color(0xFF52596E);
  static const grayDark = Color(0xFFD9D9D9);
  static const liteGray = Color(0xFFD9D9D9);
  static const countryPicker = Color(0xFFF2F9F9);
  static const liteGrayStepLine = Color(0xFF8FAABB);
  static const liteStepLine = Color(0xFFE2F0FD);
  static const inputColor = Color(0x8052596E); //alpha 50%
  static const wrong = Color(0xFFC20707);
  static const green = Color(0xFF35C141);
  static const liteGreen = Color(0xFF56C674);
  static const liteGreenBG = Color(0xFFC6F6D5);
  static const red = Color(0xFFFF1F00);
  static const darkRed = Color(0xFFC20707);
  static const infoBoxColor = Color(0xFFF7EDFF);

  static const orangeLite = Color(0xFF4D7BB7);
  static const yellow = Color(0xFFFFBD0D);
  static const orange = Color(0xFFFF7A0D);
  static const blue = Color(0xFF1DA1FF);

  static const selectedColor = Color(0xFF1F54C7);

  static const headerTextColor = Color(0xFF172B4D);
  static const appBarTextColor = Color(0xFF000000);
  static const underlineColor = Color(0xFFCCCCCC);
  static const textColorBlue = Color(0xFF2E38B6);
  static const fieldColor = Color(0xFF846AE3);
  static const questionListBackgroundColor = Color(0xFFF2F7F6);

  static const listBackgroundColor = Color(0xFFF7F7F7);
  static const listStrokeColor = Color(0xFFDDDDDD);
  static const listStrokeColorDark = Color(0xFFC3C3C3);

  /// [pie chart] color
  static const problemSolvingColor = Color(0xff9779FF);
  static const liteBlueColor = Color(0xff597df1);
  static const communicationSkillsColor = Color(0xff5C3BFF);

  static const gradientLeftColor = Color(0xB8FF0D0D);
  static const gradientRightColor = Color(0xFFFFBD0D);

  static const shimmerBaseColor = Color(0xFFD9D9D9);
  static const shimmerHighlightColor = Color(0xFFF6F6F6);

  // Gradient
  static final whiteToTransparentGradient = LinearGradient(
    colors: [
      primaryLiteColor,
      primaryLiteColor,
      primaryLiteColor.withOpacity(0.0)
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ); // Gradient

  static final accentColorToTransparentGradient = LinearGradient(
    colors: [
      Colors.white.withOpacity(0.0),
      accentColor.withOpacity(.9),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final whiteToTransparentGradientHome = LinearGradient(
    colors: [
      Colors.white.withOpacity(0.0),
      accentColor.withOpacity(.5),
      accentColor
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const baseGradient = LinearGradient(
    colors: [
      gradientLeftColor,
      gradientRightColor,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const baseGradient2 = LinearGradient(
    colors: [
      gradientLeftColor,
      gradientRightColor,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const buttonGradient = RadialGradient(
    center: Alignment(-0.2, -1.620),
    radius: 2,
    colors: [
      primaryColor,
      primaryAccentColor,
      secondaryColor,
    ],
  );

  static const btnBGGradient = LinearGradient(
    colors: [
      Color(0xFF00A299),
      Color(0xFF0EB9AF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
