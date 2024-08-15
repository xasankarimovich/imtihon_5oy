// // import 'dart:io';
// // import 'dart:isolate';
// // import 'package:dio/dio.dart';
// //
// // Future<MultipartFile> _getMultipartFile(File file) async {
// //   final ReceivePort receivePort = ReceivePort();
// //   await Isolate.spawn(
// //     _fileToMultipartFile,
// //     [file.path, receivePort.sendPort],
// //   );
// //   return await receivePort.first as MultipartFile;
// // }
// //
// // void _fileToMultipartFile(List<dynamic> args) async {
// //   final String filePath = args[0];
// //   final SendPort sendPort = args[1];
// //   final file = File(filePath);
// //   final multipartFile = await MultipartFile.fromFile(file.path);
// //   sendPort.send(multipartFile);
// // }
//
//
// import 'package:dio/dio.dart';
// import '../model/recipe_model/recipe_about_model.dart';
// class RecipeServices {
//   final String _baseUrl =
//       "https://recipes-acd0d-default-rtdb.firebaseio.com";
//   final Dio _dio = Dio();
//
//   Future<void> addRecipe(RecipeAboutModel recipeAboutModel) async {
//     try {
//       final Map<String, dynamic> recipeJson = recipeAboutModel.toJson();
//       final response =
//       await _dio.post("$_baseUrl/recipes.json", data: recipeJson);
//
//       if (response.statusCode == 200) {
//         print('Recipe added successfully');
//
//         await UserFirestore().addRecipeToUserLocal("$_baseUrl/recipes.json");
//       } else {
//         print('Failed to add retsept: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error adding retsept: $e');
//     }
//   }
//
//   Future<void> editRecipe(String id, RecipeAboutModel updatedRecipe) async {
//     try {
//       final Map<String, dynamic> recipeJson = updatedRecipe.toJson();
//       final response =
//       await _dio.put("$_baseUrl/recipes/$id.json", data: recipeJson);
//
//       if (response.statusCode == 200) {
//         print('Recipe updated successfully');
//       } else {
//         print('Failed to update recipe: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error updating recipe: $e');
//     }
//   }
//
//   Future<void> deleteRecipe(String id) async {
//     try {
//       final response = await _dio.delete("$_baseUrl/recipes/$id.json");
//       if (response.statusCode == 200) {
//         print("Retsept deleted successfully");
//       } else {
//         print("Failed to delete recipes: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("Error deleting recipes: $e");
//     }
//   }
//
//   Future<List<RecipeAboutModel>> getRecipe() async {
//     print("getRetsept");
//     try {
//       final response = await _dio.get("$_baseUrl/recipes.json");
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = response.data;
//         final recipe = data.values.map((map) {
//           return RecipeAboutModel.fromJson(Map<String, dynamic>.from(map));
//         }).toList();
//         return recipe;
//       } else {
//         return [];
//       }
//     } catch (e) {
//       return [];
//     }
//   }
// }
