import 'package:flutter/material.dart';
import 'bmi_model.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _genderController = TextEditingController();
  String _bmiResult = '';
  Color _resultColor = Colors.black;

  void _calculateBMI() {
    double weight = double.tryParse(_weightController.text) ?? 0;
    double height = double.tryParse(_heightController.text) ?? 0;

    if (weight > 0 && height > 0) {
      Person person = Person(weight, height, _genderController.text);
      BMICategoryDetails bmiCategory = person.getBMICategory();

      setState(() {
        _bmiResult = bmiCategory.description;
        _resultColor = (bmiCategory.color == "red") ? Colors.red : Colors.green;
      });
    } else {
      setState(() {
        _bmiResult = 'Please enter valid weight and height.';
        _resultColor = Colors.red;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'BMI Calculator',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(labelText: 'Enter your weight (kg)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(labelText: 'Enter your height (m)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _genderController,
              decoration: InputDecoration(labelText: 'Enter your gender'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text(
              _bmiResult,
              style: TextStyle(fontSize: 20, color: _resultColor),
            ),
          ],
        ),
      ),
    );
  }
}
