import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.g.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: TextTheme(
        headline4: GoogleFonts.lemonada(
          fontSize: 16,
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
    ),
  //checkboxTheme: CheckboxThemeData(checkColor: lightColorScheme.secondary),
  toggleableActiveColor: lightColorScheme.primary,
  dividerTheme: DividerThemeData(thickness: 1, color: lightColorScheme.secondary, indent: 20, endIndent: 20),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  textTheme: TextTheme(
    headline4: GoogleFonts.lemonada(
        fontSize: 16,
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
    toggleableActiveColor: darkColorScheme.primary,
  dividerTheme: DividerThemeData(thickness: 1, color: darkColorScheme.secondary, indent: 20, endIndent: 20),
);
