import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());
myweb() async {
  // var url = "http://192.168.43.13/cgi-bin/web2.py?x=date";
  var url =
      "http://api.openweathermap.org/data/2.5/forecast?q=varanasi&appid=524b97c385e96200fc95ceba22a57493";

  var r = await http.get(url);
  // print(r.body);
  var data = r.body;
  var fdata = jsonDecode(data);
  // print(fdata.runtimeType);
  print(fdata['list'][0]['main']['temp']);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Json App"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              FlatButton(
                onPressed: myweb,
                child: Text("Press here"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
