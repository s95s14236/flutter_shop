import 'package:flutter/material.dart';


const tQueenGrey50 = const Color(0xFFE6E7ED);
const tQueenGrey100 = const Color(0xFFC0B9BD);
const tQueenGrey600 = const Color(0xFF5D5D5E);

const tQueenBlack = const Color(0xFF120E0E);

const tQueenBrown300 = const Color(0xFF948180);
const tQueenBrown500 = const Color(0xFF995F50);
const tQueenBrown800 = const Color(0xFF4B352F);

const tQueenErrorRed = const Color(0xFFD32F2F);

const tQueenBackGroundWhite = Colors.white;


// 建立自己品牌特色的顏色

ThemeData buildQueenTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    accentColor: tQueenBlack,
    primaryColor: tQueenBackGroundWhite,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: tQueenGrey50,
      colorScheme: base.colorScheme.copyWith(
        secondary: tQueenBlack,
      ),
    ),
    buttonBarTheme: base.buttonBarTheme.copyWith(
      buttonTextTheme: ButtonTextTheme.accent,
    ),
    iconTheme: base.iconTheme.copyWith(
      color: tQueenBlack,
    ),
    
    scaffoldBackgroundColor: tQueenBackGroundWhite,
    cardColor: Colors.grey[50],
    textSelectionColor: tQueenGrey100,
    errorColor: tQueenErrorRed,
    // add the text themes (103)
    textTheme: _buildQueenTextTheme(base.textTheme),
    primaryTextTheme: _buildQueenTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildQueenTextTheme(base.accentTextTheme),
    // add the icon themes (103)
    primaryIconTheme: base.iconTheme.copyWith(
      color: tQueenBlack
    ),
    // Decorate the input (103)
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[350],
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black54,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0)
      )
    ),
  );
}


TextTheme _buildQueenTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(
          fontSize: 18.0,
        ),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        fontFamily: 'NotoSanseTC',
        displayColor: tQueenBlack,
        bodyColor: tQueenBlack,
      );
}