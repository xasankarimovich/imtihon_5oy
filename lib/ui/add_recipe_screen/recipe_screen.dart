import 'package:easy_stepper/easy_stepper.dart';
import 'package:exam_5_oy/blocs/user_bloc/user_bloc.dart';
import 'package:exam_5_oy/ui/widgets/global_button.dart';
import 'package:flutter/material.dart';

import '../asab_screen/intraduction_screen.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  final List<String> instructions = [
    'In a large bowl, mix together flour, baking powder, sugar, and salt.',
    'In a separate bowl, whisk together milk, egg, and oil or melted butter. Add vanilla extract if desired.',
    'Gradually add the liquid mixture to the dry ingredients, stirring continuously until a smooth, lump-free batter forms.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Recipe'),
        centerTitle: true,
        backgroundColor: const Color(0xff4058A0),
        actions: [
          TextButton(
            onPressed: () {
              // Clear all instructions
            },
            child: const Text(
              "Clear all",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const StepperWidget(activeStep: 3),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: instructions.length + 1,
                itemBuilder: (context, index) {
                  if (index < instructions.length) {
                    return InstructionCard(
                      index: index,
                      instruction: instructions[index],
                    );
                  } else {
                    return const InstructionInputCard();
                  }
                },
              ),
            ),
            const SizedBox(height: 16.0),
            GlobalLoadingButton(
              title: 'Next',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx){
                  return RecipeCard();
                },),);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class StepperWidget extends StatelessWidget {
  final int activeStep;

  const StepperWidget({super.key, required this.activeStep});

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: activeStep,
      steps: [
        EasyStep(icon: Icon(Icons.looks_one), title: 'Step 1'),
        EasyStep(icon: Icon(Icons.kitchen), title: 'Ingredients'),
        EasyStep(icon: Icon(Icons.list), title: 'Instructions'),
        EasyStep(icon: Icon(Icons.check), title: 'Done'),
      ],
    );
  }
}

class InstructionCard extends StatelessWidget {
  final int index;
  final String instruction;

  const InstructionCard({
    super.key,
    required this.index,
    required this.instruction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.orange,
          child: Text(
            '${index + 1}'.padLeft(2, '0'),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(instruction),
        trailing: IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            // Remove instruction
          },
        ),
      ),
    );
  }
}

class InstructionInputCard extends StatelessWidget {
  const InstructionInputCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.orange,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Add new instruction...',
            border: InputBorder.none,
          ),
          maxLines: null,
        ),
      ),
    );
  }
}
