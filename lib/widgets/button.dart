import 'package:flutter/material.dart';

class GoButton extends StatelessWidget {
  final TextEditingController weightController;
  final TextEditingController heightController;
  final Function(String, String) calculate;

  const GoButton({
    super.key,
    required this.weightController,
    required this.heightController,
    required this.calculate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: SizedBox(
          width: 180,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              print("Pressed");
              String weight = weightController.text;
              print(weight);
              String height = heightController.text;
              print(height);
              calculate(weight, height);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Color(0xFF0038FF)),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            child: const Text(
              "Calculate",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
