
import 'package:exam_5_oy/data/model/recipe_model/recipe_model.dart';

enum FormsStatus {
  initial,
  loading,
  success,
  error,
}

 List<String> globalDishType =  [
   'Breakfast',
   'Lunch',
   'Snack',
   'Brunch',
   'Dessert',
   'Dinner',
   'Appetizers'
 ];

RetseptModel globalRecipeModel = RetseptModel.initialValue();