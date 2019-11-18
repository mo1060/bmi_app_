import 'package:flutter/material.dart';

class BodyMassIndexForm extends StatefulWidget {
  @override
  _BodyMassIndexFormState createState() => _BodyMassIndexFormState();

}

class _BodyMassIndexFormState extends State<BodyMassIndexForm> {
  String _formattedText = "";
  // Text Controller
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  // handle button click and perform bmi calculation
  void onButtonClicked(){
    setState(() {

         double _finalResult = calculateBmi(_weightController.text, _heightController.text);
         _formattedText = "Dein BMI ist: ${_finalResult.toStringAsFixed(1)}";

    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
     alignment: Alignment.topCenter,
      child: ListView(
        padding: const EdgeInsets.all(16.5),
        children: <Widget>[
          Image.asset(
            'images/bmi.png',
            height: 60.0,
            width : 200.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),

                  labelText: 'Gib dein Körpergewicht ein.',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      gapPadding: 3.3,
                      borderRadius: BorderRadius.circular(3.3),

                      ),
                  focusColor: Colors.white,
                  hintText: 'Gewicht in kg eingeben z.b. 75',
                  icon: Icon(Icons.person_outline, color: Colors.pinkAccent),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),

                  labelText: 'Gib deine Körpergröße ein.',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    gapPadding: 3.3,
                    borderRadius: BorderRadius.circular(3.3),

                  ),
                  focusColor: Colors.white,
                  hintText: 'Körpergröße in Metern z.B. 1.80',
                  icon: Icon(Icons.accessibility_new, color: Colors.pinkAccent),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  )
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                  _weightController.text.isEmpty ? "Gewicht und Körpergröße eingeben" : _formattedText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19.4,
                    fontWeight: FontWeight.w400,

                  )
              ),
            ),
          ),
          FlatButton(
            color: Colors.pinkAccent,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
            onPressed: () {
              /*...*/
              print("pressed");
              onButtonClicked();
            },
            child: Text(
              "Berechne BMI",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),

    );
  }

  double calculateBmi(String weight, String height) {

    if(int.parse(weight).toString().isNotEmpty && height.toString().isNotEmpty){
      return int.parse(weight) / (double.parse(height) * double.parse(height));
    } else {
      return 0.0;
    }
  }
}
