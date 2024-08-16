import 'package:exam_5_oy/blocs/retsipe_bloc/recipe_event.dart';
import 'package:exam_5_oy/data/model/fomrs_status.dart';
import 'package:exam_5_oy/data/model/recipe_model/recipe_model.dart';
import 'package:exam_5_oy/main.dart';
import 'package:exam_5_oy/utils/extension/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/retsipe_bloc/recipe_bloc.dart';
import '../../cubit/image_cubit/image_cubit.dart';
import '../widgets/custom_widget.dart';
import '../widgets/easy_stepper.dart';
import '../widgets/global_button.dart';
import 'ingridients_screen.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  bool isLoading = false;
  int _serving = 4;
  int _selectedDifficulty = 0;
  List<String> selectedDishTypes = [];
  String globalDifficulty = '';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cookTimeHourController = TextEditingController();
  final TextEditingController _cookTimeMinuteController =
      TextEditingController();
  final TextEditingController _hashTagsController = TextEditingController();
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  // void _nextStep() {
  //   setState(() {
  //     isLoading = true;
  //   });
  //
  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       isLoading = false;
  //       if (_currentStep < 3) {
  //         _currentStep++;
  //       }
  //     });
  //
  //     if (_currentStep == 1) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => const Ingredients()),
  //       );
  //     }
  //   } else {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Recipe",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Clear all",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
        backgroundColor: const Color(0xff4058A0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const CustomEasyStepper(),
                16.boxH(),
                NameContainer(
                  title: 'Name',
                ),
                5.boxH(),
                CustomInputField(
                  hintText: 'Name your recipe',
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a recipe name';
                    }
                    return null;
                  },
                ),
                10.boxH(),
                NameContainer(
                  title: 'Number',
                ),
                10.boxH(),
                Row(
                  children: [
                    const Text("Serving for"),
                    16.boxW(),
                    buildNumberSelector(),
                  ],
                ),
                10.boxH(),
                NameContainer(
                  title: 'Cook Time',
                ),
                10.boxH(),
                Row(
                  children: [
                    Expanded(
                      child: CustomInputField(
                        hintText: 'Hour',
                        controller: _cookTimeHourController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter cook time hour';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                    ),
                    16.boxW(),
                    Expanded(
                      child: CustomInputField(
                        hintText: 'Minute',
                        controller: _cookTimeMinuteController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter cook time minute';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                10.boxH(),
                NameContainer(
                  title: 'Difficulty',
                ),
                10.boxH(),
                buildDifficultySelector(),
                10.boxH(),
                NameContainer(
                  title: 'Dish Type',
                ),
                10.boxH(),
                buildChipSelector(
                  [
                    'Breakfast',
                    'Lunch',
                    'Snack',
                    'Brunch',
                    'Dessert',
                    'Dinner',
                    'Appetizers'
                  ],
                  selectedDishTypes,
                ),
                20.boxH(),
                NameContainer(title: 'Hashtags'),
                10.boxH(),
                CustomInputField(
                  hintText: 'Add hashtags',
                  controller: _hashTagsController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some hashtags';
                    }
                    return null;
                  },
                ),
                20.boxH(),
                GlobalLoadingButton(
                  isLoading: isLoading,
                  title: 'Next',
                  onTap: () {
                    String imgUrl = context.read<ImageCubit>().state.imagePath;
                    setState(() {
                      isLoading = true;
                    });

                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        globalRecipeModel = globalRecipeModel.copyWith(
                          name: _nameController.text,
                          difficulty: globalDifficulty,
                          preparationTime: _cookTimeHourController.text,
                          image: imgUrl ?? '',

                        );
                        context.read<RecipeBloc>().add(
                              InsertRecipeEvent(
                                recipeModel: globalRecipeModel,
                              ),
                            );
                        isLoading = false;
                        if (_currentStep < 3) {
                          _currentStep++;
                        }
                      });

                      if (_currentStep == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Ingredients()),
                        );
                      }
                    } else {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNumberSelector() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (_serving > 1) _serving--;
            });
          },
        ),
        Text('$_serving'),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              _serving++;
            });
          },
        ),
      ],
    );
  }

  Widget buildDifficultySelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ['Easy', 'Medium', 'Hard'].asMap().entries.map((entry) {
        int index = entry.key;
        String difficulty = entry.value;
        return ChoiceChip(
          label: Text(difficulty),
          selected: _selectedDifficulty == index,
          onSelected: (selected) {
            setState(() {
              _selectedDifficulty = index;
              globalDifficulty = difficulty;
            });
          },
        );
      }).toList(),
    );
  }

  Widget buildChipSelector(List<String> options, List<String> selectedOptions) {
    return Wrap(
      spacing: 8.0,
      children: options.map((option) {
        return FilterChip(
          label: Text(option),
          selected: selectedOptions.contains(option),
          onSelected: (selected) {
            setState(
              () {
                selected
                    ? selectedOptions.add(option)
                    : selectedOptions.remove(option);
              },
            );
          },
        );
      }).toList(),
    );
  }
}
