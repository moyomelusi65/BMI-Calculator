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
      padding: const EdgeInsetsGeometry.only(top: 50),
      child: Center(
        child: SizedBox(
          width: 180,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              String weight = weightController.text;
              String height = heightController.text;
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
