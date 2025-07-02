import 'package:demo_iap_flutter/common/colors.dart';
import 'package:flutter/material.dart';

class MyThemes {
  static final lightTheme = ThemeData(
    bottomAppBarTheme: const BottomAppBarTheme(color: blockLight),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: slider,
    ),
    primaryColor: primaryLight,
    // input back ground
    scaffoldBackgroundColor: backgroundLight,
    badgeTheme: const BadgeThemeData(backgroundColor: black005),
    sliderTheme: const SliderThemeData(inactiveTrackColor: black01),
    // step rectangle home color
    searchViewTheme: const SearchViewThemeData(backgroundColor: black),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: black),
      displayMedium: TextStyle(color: black05),
      bodySmall: TextStyle(color: olive),
      titleLarge: TextStyle(color: white),
      labelSmall: TextStyle(color: white08),
      labelMedium: TextStyle(color: black005),
      labelLarge: TextStyle(color: black),
    ),
    iconTheme: const IconThemeData(color: black07),
    buttonTheme: const ButtonThemeData(buttonColor: buttonFillLight),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.resolveWith(
          (states) => const TextStyle(color: white),
        ),
      ),
    ),
    cardTheme: const CardTheme(color: colorImageItemLight),
    dividerTheme: DividerThemeData(color: Colors.grey.shade300),
    dialogBackgroundColor: whiteLight,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color.fromRGBO(245, 250, 255, 1),
    ),
    dividerColor: black005,
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: white005),
    unselectedWidgetColor: white.withOpacity(0.6),
    cardColor: colorSelectedImageLight,
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: white,
      indicatorColor: redLight,
    ),
    canvasColor: black003,
    popupMenuTheme: const PopupMenuThemeData(
      color: Color.fromRGBO(255, 255, 255, 1),
    ),
    listTileTheme: const ListTileThemeData(
      selectedTileColor: redLight,
    ),
  );

  static final darkTheme = ThemeData(
    bottomAppBarTheme: const BottomAppBarTheme(color: blockDark),
    scaffoldBackgroundColor: backgroundDark,
    badgeTheme: const BadgeThemeData(backgroundColor: white005),
    sliderTheme: const SliderThemeData(inactiveTrackColor: white01),
    tabBarTheme: const TabBarTheme(unselectedLabelColor: slider),
    primaryColor: primaryDark,
    // button theme
    searchViewTheme: const SearchViewThemeData(backgroundColor: buttonFillDark),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: white),
      displayMedium: TextStyle(color: white05),
      bodySmall: TextStyle(color: white),
      titleLarge: TextStyle(color: black),
      labelSmall: TextStyle(color: black08),
      labelMedium: TextStyle(color: white01),
      labelLarge: TextStyle(color: greenDark),
    ),
    iconTheme: const IconThemeData(color: white07),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.resolveWith(
          (states) => const TextStyle(color: white),
        ),
      ),
    ),
    cardTheme: const CardTheme(color: colorImageItemDark),
    dividerTheme: DividerThemeData(color: Colors.grey.shade800),
    listTileTheme: const ListTileThemeData(
      selectedTileColor: redDark,
    ),

    dialogBackgroundColor: const Color.fromRGBO(65, 65, 65, 1), // greyDark2,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
    ),
    dividerColor: white01,
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: grey.withOpacity(0.1)),
    unselectedWidgetColor: grey.withOpacity(0.6),
    cardColor: colorSelectedImageDark,
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: black,
      indicatorColor: redDark,
    ),
    canvasColor: white08,
    popupMenuTheme: const PopupMenuThemeData(
      color: Color.fromRGBO(65, 65, 65, 1),
    ),
  );
}
