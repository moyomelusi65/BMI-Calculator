import 'package:bmi_calculator/widgets/button.dart';
import 'package:bmi_calculator/widgets/catagory_indicator.dart';
import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  Color myColor = Colors.transparent;

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController mainResult = TextEditingController();

  void calculateBMI(String weight, String height) async {
    double doubleWeight = double.parse(weight);
    double doubleHeight = double.parse(height);

    double bmi = (doubleWeight / (doubleHeight * doubleHeight));

    setState(() {
      mainResult.text = bmi.toStringAsFixed(2);
      myColor = getBMIColor(bmi); // Use the color function
    });
  }

  Color getBMIColor(double bmi) {
    if (bmi < 18.5) {
      return const Color(0xFF87B1D9); // Blue for underweight
    } else if ((bmi >= 18.5 && bmi <= 24.9)) {
      return const Color(0xFF3DD365); // Green for normal
    } else if (bmi >= 25 && bmi <= 29.9) {
      return const Color(0xFFEEE133); // Orange for overweight
    } else if (bmi >= 30 && bmi <= 34.9) {
      return const Color(0xFFFD802E); // Obese
    } else {
      return const Color(0xFFF95353); // Extreme
    }
  }

  @override
  Widget build(BuildContext context) {
    // Height of current screen.
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFF6DD5ED), const Color(0xFF2193B0)],
            ),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Text(
                  "BMI Calculator",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0038FF),
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: TextField(
                    controller: weightController,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter your weight kg",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.all(15),
                  child: TextField(
                    controller: heightController,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter your height cm",
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                GoButton(
                  weightController: weightController,
                  heightController: heightController,
                  calculate: calculateBMI,
                ),
                SizedBox(height: 80),

                // BMI category color indicators.
                Center(
                  child: Row(
                    children: [
                      CatagoryIndicator(
                        color: Color(0xFF87B1D9),
                        label: "Underweight",
                      ),
                      CatagoryIndicator(
                        color: Color(0xFF3DD365),
                        label: "Normal",
                      ),
                      CatagoryIndicator(
                        color: Color(0xFFEEE133),
                        label: "Overweight",
                      ),
                      CatagoryIndicator(
                        color: Color(0xFFFD802E),
                        label: "Obese",
                      ),
                      CatagoryIndicator(
                        color: Color(0xFFF95353),
                        label: "Extreme",
                      ),
                    ],
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
