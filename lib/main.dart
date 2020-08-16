import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "x" ||
        buttonText == "%") {
      num1 = double.parse(output);

      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      } else if (operand == "-") {
        _output = (num1 - num2).toString();
      } else if (operand == "/") {
        _output = (num1 / num2).toString();
      } else if (operand == "x") {
        _output = (num1 * num2).toString();
      } else if (operand == "%") {
        _output = (num1 % num2).toString();
      } else {
        num1 = 0;
        num2 = 0;
        operand = "";
      }
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(1);
    });
  }

  ///Widgets ...............>>>>>>>>>>>>>>>>>>>>
  Widget buildNumberPad(String buttonText) {
    return Expanded(
      child: Container(
        width: 90,
        height: 90,
        margin: EdgeInsets.all(5),
        child: RaisedButton(
          splashColor: Colors.grey[800],
          highlightColor: Colors.grey[800],
          color: Colors.grey[900],
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  Widget primaryColor(String buttonText) {
    return Expanded(
      child: Container(
        width: 90,
        height: 90,
        margin: EdgeInsets.all(5),
        child: RaisedButton(
          splashColor: Colors.grey[800],
          highlightColor: Colors.grey[800],
          color: Colors.grey[900],
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.lightGreenAccent[400],
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  Widget btnprimaryColor(String buttonText) {
    return Expanded(
      child: Container(
        width: 90,
        height: 90,
        margin: EdgeInsets.all(5),
        child: RaisedButton(
          splashColor: Colors.lightGreenAccent[200],
          highlightColor: Colors.lightGreenAccent[300],
          color: Colors.lightGreenAccent[200],
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 35.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                  child: Text(
                    output,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                // Divide function
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(
                    color: Colors.grey[400],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.all(5),
                              child: RaisedButton(
                                splashColor: Colors.grey[800],
                                highlightColor: Colors.grey[800],
                                color: Colors.grey[900],
                                child: Text(
                                  "C",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 25.0,
                                  ),
                                ),
                                onPressed: () => buttonPressed("C"),
                              ),
                            ),
                            primaryColor("()"),
                            primaryColor("%"),
                            primaryColor("/"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildNumberPad("7"),
                            buildNumberPad("8"),
                            buildNumberPad("9"),
                            primaryColor("x"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildNumberPad("4"),
                            buildNumberPad("5"),
                            buildNumberPad("6"),
                            primaryColor("-"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildNumberPad("1"),
                            buildNumberPad("2"),
                            buildNumberPad("3"),
                            primaryColor("+"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildNumberPad("+/-"),
                            buildNumberPad("0"),
                            buildNumberPad("."),
                            btnprimaryColor("="),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
