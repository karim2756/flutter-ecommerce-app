import 'package:flutter/material.dart';
import 'package:my_project/core/constant/color.dart';

ThemeData? themeEnglish = ThemeData(
    textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 23, color: AppColor.black),
        headlineLarge: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 28, color: AppColor.black),
        bodyLarge: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontSize: 15,
            fontWeight: FontWeight.bold)),
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: AppColor.backgroundColor,
            fontSize: 20,
            fontWeight: FontWeight.bold)),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: AppColor.primaryColor));
ThemeData? themeArabic = ThemeData(
    fontFamily: "Cairo",
    textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 23, color: AppColor.black),
        headlineLarge: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 28, color: AppColor.black),
        bodyLarge: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontSize: 15,
            fontWeight: FontWeight.bold)),
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: AppColor.backgroundColor,
            fontSize: 20,
            fontWeight: FontWeight.bold)),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: AppColor.primaryColor));
