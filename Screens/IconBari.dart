
import 'dart:math';

import 'package:bugunun_tarihi1/BildirimAyarlar/BildirimVerisi.dart';
import 'package:bugunun_tarihi1/TemaVeRenkler/TemaProvider.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'TakvimEkrani.dart';

class IconBari extends StatefulWidget {
  @override
  _IconBariState createState() => _IconBariState();
}

class _IconBariState extends State<IconBari> {
  Bildirim bildirim = Bildirim();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
            bildirim.bildirimkontrol
                ? Icons.notifications_none
                : Icons.notifications_off,
            size: 32,
          ),
          onPressed: () {
            setState(() {
              bildirim.bildirimDegistir();
            });
            if (bildirim.bildirimkontrol == true) {
              MyFlushbar(context, "Hatırlatma(bildirim) açıldı");
            }
            else{
              MyFlushbar(context, "Hatırlatma(bildirim) kapandı");
            }
          },
        ),
        Padding(
          child: Consumer<MyThemeModel>(
            builder: (context, theme, child) => GestureDetector(
                child: Transform.rotate(
                  angle: 45*pi/180,
                  child: Icon(theme.isLightTheme
                      ?Icons.wb_sunny
                      :Icons.brightness_3,
                    size: 32,
                  ),
                ),
                onTap: () => theme.changeTheme()),
          ),
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.2,
              right: MediaQuery.of(context).size.width * 0.2),
        ),
        InkWell(
          child: Icon(
            Icons.calendar_today,
            size: 30,
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return TakvimEkrani();
                });
          },
        ),
      ],
    );
  }

  Future<dynamic> MyFlushbar(BuildContext context,String metin){
    return Flushbar(
      messageText: Text(metin,textAlign: TextAlign.center,),
      duration: Duration(milliseconds: 1500),
      flushbarPosition: FlushbarPosition.BOTTOM,
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.08),
      backgroundColor: Theme.of(context).primaryColor,
      isDismissible: false,
      animationDuration: Duration(milliseconds: 500),
    ).show(context);

  }
}


