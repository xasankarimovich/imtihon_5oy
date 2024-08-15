import 'dart:io';

import 'package:exam_5_oy/data/model/fomrs_status.dart';
import 'package:exam_5_oy/data/model/recipe_model/recipe_model.dart';

class RecipeState {
  final String errorMessage;
  final File? file;
  final FormsStatus status;
  final RetseptModel recipeModel;
  final List<RetseptModel> listRecipe;

  RecipeState({
    required this.errorMessage,
    required this.file,
    required this.status,
    required this.recipeModel,
    required this.listRecipe,
  });

  static RecipeState initialValue() => RecipeState(
        errorMessage: '',
        file: null,
        status: FormsStatus.initial,
        recipeModel: RetseptModel.initialValue(),
        listRecipe: [],
      );
  RecipeState copyWith({
    String? errorMessage,
    File? file,
    FormsStatus? status,
    RetseptModel? recipeModel,
    List<RetseptModel>? listRecipe,
  }) =>
      RecipeState(
        errorMessage: errorMessage ?? this.errorMessage,
        file: file ?? this.file,
        status: status ?? this.status,
        recipeModel: recipeModel ?? this.recipeModel,
        listRecipe: listRecipe ?? this.listRecipe,
      );
}
