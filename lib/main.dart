import 'package:flutter/material.dart';
import 'package:bmi_app/ui/body_mass_index_form.dart';
void main() => runApp(BmiApp());

class BmiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = "GIRLY BMI RECHNER";
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
          centerTitle: true,
          backgroundColor: Colors.pink[400],
        ),
        backgroundColor: Colors.pink[100],
        body: BodyMassIndexForm(),
      )
    );
  }
}




