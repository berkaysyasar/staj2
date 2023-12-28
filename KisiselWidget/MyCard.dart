import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard(this.tarih, this.bilgiler);

  String tarih;
  List<String> bilgiler = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          tarih, style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: bilgiler.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Theme.of(context).cardColor,
                    elevation: 0,
                    margin:EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
                    child: Padding(padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                      child: Text(bilgiler[index]),
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
