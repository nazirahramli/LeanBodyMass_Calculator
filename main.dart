import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _heightctrl = new TextEditingController();
  TextEditingController _weightctrl = new TextEditingController();
  String lbm;
  String radioItem = 'First';
  int rb = 1;
  int ri = 1;
  double a = 0, b = 0;
  double h = 0, w = 0;
  double result = 0, aa = 0, bb = 0, cc = 0, dd = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Lean Body Mass'),
          brightness: Brightness.light,
          backgroundColor: Colors.greenAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.all(8.0),
            ),
            new Text(
              'Gender :',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: rb,
                  onChanged: (val) {
                    setState(() {
                      radioItem = 'First';
                      rb = 1;
                    });
                  },
                ),
                Text(
                  'Male',
                  style: new TextStyle(fontSize: 17.0),
                ),
                Radio(
                  value: 2,
                  groupValue: rb,
                  onChanged: (val) {
                    setState(() {
                      radioItem = 'Second';
                      rb = 2;
                    });
                  },
                ),
                Text(
                  'Female',
                  style: new TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
            new Padding(
              padding: new EdgeInsets.all(8.0),
            ),
            new Text(
              'Age 14 or younger? :',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: ri,
                  onChanged: (val) {
                    setState(() {
                      radioItem = 'Second';
                      ri = 1;
                    });
                  },
                ),
                Text(
                  'Yes',
                  style: new TextStyle(fontSize: 17.0),
                ),
                Radio(
                  value: 2,
                  groupValue: ri,
                  onChanged: (val) {
                    setState(() {
                      radioItem = 'Second';
                      ri = 2;
                    });
                  },
                ),
                Text(
                  'No',
                  style: new TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
              child: TextField(
                controller: _heightctrl,
                keyboardType: TextInputType.numberWithOptions(),
                style: new TextStyle(
                    fontSize: 20.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(30.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[500]),
                    hintText: "Height (cm)",
                    fillColor: Colors.white70),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                style: new TextStyle(
                    fontSize: 20.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
                controller: _weightctrl,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(30.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[500]),
                    hintText: "Weight (kg)",
                    fillColor: Colors.white70),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5),
                  child: new MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    elevation: 5.0,
                    minWidth: 100.0,
                    height: 50,
                    color: Colors.greenAccent,
                    child: new Text('CALCULATE',
                        style:
                            new TextStyle(fontSize: 16.0, color: Colors.black)),
                    onPressed: _onPress,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: new MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    elevation: 5.0,
                    minWidth: 120.0,
                    height: 50,
                    color: Colors.greenAccent,
                    child: new Text('CLEAR',
                        style:
                            new TextStyle(fontSize: 16.0, color: Colors.black)),
                    onPressed: _clear,
                  ),
                ),
              ],
            ),
            new Padding(
              padding: new EdgeInsets.all(8.0),
            ),
            Text('The Lean Body Mass based on different Formula:',
                textScaleFactor: 1.2),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Table(
                border: TableBorder.all(color: Colors.blue[700]),
                children: [
                  TableRow(children: [
                    Text(
                      'FORMULA',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textScaleFactor: 1.1,
                    ),
                    Text(
                      'LEAN BODY MASS',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textScaleFactor: 1.1,
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                      'Boer',
                      textScaleFactor: 1.1,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('$aa kg', textScaleFactor: 1.1),
                  ]),
                  TableRow(children: [
                    Text(
                      'James',
                      textScaleFactor: 1.1,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('$bb kg', textScaleFactor: 1.1),
                  ]),
                  TableRow(children: [
                    Text(
                      'Hume',
                      textScaleFactor: 1.1,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('$cc kg', textScaleFactor: 1.1),
                  ]),
                  TableRow(children: [
                    Text(
                      'Peter',
                      textScaleFactor: 1.1,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('$dd kg', textScaleFactor: 1.1),
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onPress() {
    setState(() {
      if (rb == 1 && ri == 2) {
        h = double.parse(_heightctrl.text);
        w = double.parse(_weightctrl.text);

        aa = (0.407 * w) + (0.267 * h) - 19.2;
        bb = (1.1 * w) - (128 * (w / h * w / h));
        cc = (0.32810 * w) + (0.33929 * h) - 29.5336;
        dd = 0;
      } else {
        if (rb == 2 && ri == 2) {
          h = double.parse(_heightctrl.text);
          w = double.parse(_weightctrl.text);

          aa = (0.252 * w) + (0.473 * h) - 48.3;
          bb = (1.07 * w) - (148 * (w / h * w / h));
          cc = (0.29569 * w) + (0.41813 * h) - 43.2933;
          dd = 0.0;
        } else {
          if (rb == 1 || rb == 2 && ri == 1) {
            h = double.parse(_heightctrl.text);
            w = double.parse(_weightctrl.text);
            double x = pow(w, 0.6469);
            double y = pow(h, 0.7236);
            double ecv = 0.0215 * x * y;
            aa = 0.0;
            bb = 0.0;
            cc = 0.0;
            dd = 3.8 * ecv;
          }
        }
      }

      a = double.parse(_heightctrl.text);
      b = double.parse(_weightctrl.text);
    });
  }

  void _clear() {
    _heightctrl.clear();
    _weightctrl.clear();
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }
}
