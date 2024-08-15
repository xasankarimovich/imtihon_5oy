import 'package:exam_5_oy/ui/add_recipe_screen/recipe_screen.dart';
import 'package:exam_5_oy/ui/widgets/global_button.dart';
import 'package:exam_5_oy/utils/extension/extension.dart';
import 'package:flutter/material.dart';
import '../widgets/comment.dart';
import 'instruction_screen.dart';

class Ingredients extends StatefulWidget {
  const Ingredients({super.key});

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  final List<String> ingredients = [
    '2 cups all-purpose flour',
    '2 teaspoons baking powder',
    '2 tablespoons sugar',
    '1/2 teaspoon salt',
    '1.5 cups milk',
    '1 large egg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingredients'),
        centerTitle: true,
        backgroundColor: const Color(0xff4058A0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StepperWidget(activeStep: 1),
            10.boxH(),
            AnimatedTextField(),
            Spacer(),
            GlobalLoadingButton(
              title: 'Next',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) {
                      return InstructionsScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
