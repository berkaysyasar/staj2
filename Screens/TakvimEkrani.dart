import '../KisiselWidget/Takvim.dart' as Takvim;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Gunler.dart';

class TakvimEkrani extends StatefulWidget{
  @override
  _TakvimEkraniState createState() => _TakvimEkraniState();
}

class _TakvimEkraniState extends State<TakvimEkrani> {
  String tarih=DateTime.now().day.toString() + DateTime.now().month.toString();
  @override
  Widget build(BuildContext context) {

    return CupertinoAlertDialog(
      actions: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height:
          MediaQuery.of(context).size.height * 0.3,
          child: Takvim.CupertinoDatePicker(
            backgroundColor: Theme.of(context).dialogBackgroundColor,
            initialDateTime: DateTime.now(),
            mode: Takvim.CupertinoDatePickerMode.date,
            onDateTimeChanged: (date) {
              setState(() {
                tarih = date.day.toString() +
                    date.month.toString();
              });
            },
          ),
        ),
        FlatButton(
            padding:
            EdgeInsets.only(top: 9, bottom: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.zero,
                    topRight: Radius.zero)),
            color: Theme.of(context).dialogBackgroundColor,
            onPressed: () {
              print(tarih);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Gunler().bilgiCek(tarih)));
            },
            child: Text(
              "Tamam",
              style: TextStyle(
                  color: Colors.black, fontSize: 25),
            ))
      ],
    );
  }
}