import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(primarySwatch: Colors.purple),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tfWeightController = TextEditingController();
  var tfHeightInFeetController = TextEditingController();
  var tfHeightInInchesController = TextEditingController();
  var result = "Result";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: tfWeightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Enter Weight",
                  hintText: "in lbs",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: tfHeightInFeetController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Enter Height(Feets)",
                  hintText: "in feet ",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: tfHeightInInchesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Enter Height(Inches)",
                  hintText: "in inches ",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: _calculateBMI,
              child: Text("Calculate BMI"),
              color: Colors.purple,
              textColor: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Text("$result"),
          ],
        ),
      ),
    );
  }

  _calculateBMI() {
    double weight = double.parse(tfWeightController.text);
    double heightInFeet = double.parse(tfHeightInFeetController.text);
    double heightInInches = double.parse(tfHeightInInchesController.text);
    double totalInches = (heightInFeet * 12) + heightInInches;

    double calculatedResult = (weight * 703) / (totalInches * totalInches);

    if (calculatedResult < 18.5) {
      result = "Your BMI is $calculatedResult ,You are under weight";
    } else if (calculatedResult >= 18.5 || calculatedResult <= 24.9) {
      result = " Your BMI is $calculatedResult ,You are normal weight";
    } else if (calculatedResult >= 25 || calculatedResult <= 29.9) {
      result = " Your BMI is $calculatedResult ,You are over weight";
    } else {
      result = "Your BMI is $calculatedResult ,You are obesity";
    }
    setState(() {});
  }
}
