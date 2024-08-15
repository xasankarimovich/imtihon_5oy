import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class CustomEasyStepper extends StatefulWidget {
  const CustomEasyStepper({super.key});

  @override
  State<CustomEasyStepper> createState() => _CustomEasyStepperState();
}

class _CustomEasyStepperState extends State<CustomEasyStepper> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: _currentStep,
      steps: const [
        EasyStep(
          title: "Recipe Information",
          icon: Icon(Icons.receipt),
        ),
        EasyStep(
          title: "Ingredients",
          icon: Icon(Icons.info),
        ),
        EasyStep(
          title: "Introduction",
          icon: Icon(Icons.list),
        ),
        EasyStep(
          title: "Summary",
          icon: Icon(Icons.check_circle),
        ),
      ],
    );
  }
}
