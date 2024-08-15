import 'package:equatable/equatable.dart';
import 'package:exam_5_oy/data/model/recipe_model/recipe_model.dart';

abstract class RecipeEvent{}

class InsertRecipeEvent extends RecipeEvent with EquatableMixin{
  final RetseptModel recipeModel;
  InsertRecipeEvent({required this.recipeModel});
  @override
  List<Object?> get props =>[
    recipeModel,
  ];
}


class UpdateRecipeEvent extends RecipeEvent with EquatableMixin{
  final RetseptModel recipeModel;
  UpdateRecipeEvent({required this.recipeModel});
  @override
  List<Object?> get props =>[
    recipeModel,
  ];
}


class DeleteRecipeEvent extends RecipeEvent with EquatableMixin{
  final String recipeUId;
  DeleteRecipeEvent({required this.recipeUId});
  @override
  List<Object?> get props =>[
    recipeUId,
  ];
}

class GetAllRecipeEvent extends RecipeEvent{}

