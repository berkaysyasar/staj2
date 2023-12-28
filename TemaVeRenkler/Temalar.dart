
import 'package:flutter/material.dart';

import 'Renkler.dart';

ThemeData themeData(BuildContext context){
  return ThemeData(
    primaryColor:appbar,
    cardColor: card,
    scaffoldBackgroundColor: body,
    iconTheme: IconThemeData(color: icon),
    textTheme: TextTheme(headline3: TextStyle(color: baslik,fontSize: 25)),
    dialogBackgroundColor: dialog,
  );
}

ThemeData darkThemeData(BuildContext context){
  return ThemeData.dark().copyWith(
    primaryColor:appbardark,
    cardColor: carddark,
    scaffoldBackgroundColor: bodydark,
    iconTheme: IconThemeData(color: icondark),
    textTheme: TextTheme(headline3: TextStyle(color: baslikdark,fontSize: 25)),
    dialogBackgroundColor: dialogdark,
  );
}