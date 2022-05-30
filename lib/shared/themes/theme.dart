import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.g.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: TextTheme(
        headline4: GoogleFonts.lemonada(
          fontSize: 24,
          color: lightColorScheme.onBackground,
        )
    ),
    colorScheme: lightColorScheme,
    appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: lightColorScheme.background,
        titleTextStyle: GoogleFonts.lemonada(
          fontSize: 23,
          color: lightColorScheme.onBackground,
        ),
        iconTheme: IconThemeData(color: lightColorScheme.primary)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: GoogleFonts.tajawal(
        color: lightColorScheme.onBackground,
      ),
      unselectedLabelStyle: GoogleFonts.lemonada(
        color: lightColorScheme.onBackground,
      ),
    )
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  textTheme: TextTheme(
    headline4: GoogleFonts.lemonada(
        fontSize: 24,
        color: darkColorScheme.onBackground,
    )
  ),
    colorScheme: darkColorScheme,
    scaffoldBackgroundColor: darkColorScheme.background,
    appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: darkColorScheme.background,
        titleTextStyle: GoogleFonts.lemonada(
          fontSize: 23,
          color: darkColorScheme.onBackground,
        ),
        iconTheme: IconThemeData(color: darkColorScheme.primary)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedLabelStyle: GoogleFonts.tajawal(
      color: darkColorScheme.onBackground,
    ),
    unselectedLabelStyle: GoogleFonts.lemonada(
      color: darkColorScheme.onBackground,
    ),
  ),
);
