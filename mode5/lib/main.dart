import 'package:flutter/material.dart';
import 'package:mode5/wedget/expenss.dart';
//import 'package:flutter/services.dart';

// ignore: non_constant_identifier_names
var Kcolorthem = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 68, 255, 0),
);

// ignore: non_constant_identifier_names
var KDarkthem = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);
void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
  //  ((fn) {
      runApp(
        MaterialApp(
          darkTheme: ThemeData.dark().copyWith(
            useMaterial3: true,
            colorScheme: KDarkthem,
            cardTheme: const CardTheme().copyWith(
              color: KDarkthem.secondaryContainer,
              margin: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 5,
              ),
            ),
          ),
          theme: ThemeData().copyWith(
            useMaterial3: true,
            colorScheme: Kcolorthem,
            appBarTheme: const AppBarTheme().copyWith(
                backgroundColor: Kcolorthem.onPrimaryContainer,
                foregroundColor: Kcolorthem.primaryContainer,
                titleTextStyle:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            cardTheme: const CardTheme().copyWith(
              color: Kcolorthem.secondaryContainer,
              margin: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 5,
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(),
            ),
            textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Kcolorthem.onSecondaryContainer,
                    fontSize: 12,
                  ),
                ),
          ),
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          home: const expenss(),
        ),
      );
    }//),
//  );
//}
