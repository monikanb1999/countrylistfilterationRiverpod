import 'package:flutter/material.dart';
import 'package:weather_app/constants/color_manager.dart';

ThemeData applicationTheme() {
  return ThemeData(
    primarySwatch: ColorManager.primary.getMaterialColorFromColor(),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: ColorManager.primary.getMaterialColorFromColor(),
      accentColor: ColorManager.primary.getMaterialColorFromColor(),
      // errorColor: ColorManager.red,
      backgroundColor: ColorManager.offWhite,
    ),
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primary, //set opacity to 70%
    primaryColorDark: ColorManager.primary, //darker shade of primary color
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    // disabledColor: ColorManager.gray,
    // splashColor: ColorManager.primary, //set opacity to 70%

    // // CardView Theme
    // cardTheme: CardTheme(
    //     color: ColorManager.white,
    //     shadowColor: ColorManager.gray,
    //     elevation: AppSize.s4),

    // // AppBar Theme
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorManager.white,
      surfaceTintColor: Colors.transparent,
    ),

    // // Button Theme
    // buttonTheme: ButtonThemeData(
    //     shape: const StadiumBorder(),
    //     disabledColor: ColorManager.gray,
    //     buttonColor: ColorManager.primary,
    //     splashColor: ColorManager.primary), //set opacity to 70%

    // // Text Theme
    // textTheme: TextTheme(
    //   headlineLarge:
    //       getBoldStyle(color: ColorManager.black, fontSize: FontSize.s16),
    //   headlineMedium:
    //       getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s16),
    //   headlineSmall:
    //       getRegularStyle(color: ColorManager.black, fontSize: FontSize.s16),
    // ),

    // // Input Decoration Theme
    // inputDecorationTheme: InputDecorationTheme(
    //   contentPadding: const EdgeInsets.all(AppPadding.p8),
    //   hintStyle: getRegularStyle(color: ColorManager.gray),
    //   labelStyle: getMediumStyle(color: ColorManager.black),
    //   errorStyle: getRegularStyle(color: ColorManager.red),
    //   enabledBorder: OutlineInputBorder(
    //       borderSide:
    //           BorderSide(color: ColorManager.gray, width: AppSize.s1_5),
    //       borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    //   focusedBorder: OutlineInputBorder(
    //       borderSide:
    //           BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    //       borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    //   errorBorder: OutlineInputBorder(
    //       borderSide:
    //           BorderSide(color: ColorManager.red, width: AppSize.s1_5),
    //       borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    //   focusedErrorBorder: OutlineInputBorder(
    //       borderSide:
    //           BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    //       borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
  );
}
