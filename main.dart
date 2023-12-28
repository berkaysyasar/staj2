import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'Screens/HomeScreen.dart';
import 'TemaVeRenkler/TemaProvider.dart';
import 'TemaVeRenkler/Temalar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      create: (context)=>MyThemeModel(),
      child: Consumer<MyThemeModel>(
        builder: (context,theme,child)=>
            MaterialApp(
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              supportedLocales: [
                const Locale('en'),
                const Locale('tr'),
              ],
              theme: themeData(context),
              darkTheme: darkThemeData(context),
              themeMode: theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
              home: HomeScreen(),
            ),
      ),
    );
  }

}