import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:exam_5_oy/blocs/retsipe_bloc/recipe_event.dart';
import 'package:exam_5_oy/blocs/retsipe_bloc/recipe_state.dart';
import 'package:exam_5_oy/data/model/fomrs_status.dart';
import 'package:exam_5_oy/data/model/recipe_model/recipe_model.dart';
import 'package:exam_5_oy/utils/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeState.initialValue()) {
    on<InsertRecipeEvent>(_insertRecipe);
    on<GetAllRecipeEvent>(_getAllRecipe);
    on<UpdateRecipeEvent>(_updateRecipe);
    on<DeleteRecipeEvent>(_deleteRecipe);
  }

  Future<void> _insertRecipe(
      InsertRecipeEvent event, Emitter<RecipeState> emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    try {
      final Uri uri = Uri.parse(
          "https://imtihon-4oy-default-rtdb.europe-west1.firebasedatabase.app/recipe.json");
      debugPrint('___________________-malumot add qilish');
      final Response response = await post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(event.recipeModel.toJson()),
      );

      if (response.statusCode == 200) {
        debugPrint(
            '______________________________________ status code ${response.statusCode}');
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        RetseptModel updatedRecipeModel = event.recipeModel.copyWith(
          id: responseData['name'],
        );

        debugPrint(
            "______________________________ recipe model uid ${updatedRecipeModel.id}");

        // Agar faqat UID yangilanishi kerak bo'lsa, update qilish uchun yuboriladi
        add(UpdateRecipeEvent(recipeModel: updatedRecipeModel));
      } else {
        debugPrint(
            '______________________________________ status code ${response.statusCode}');

        emit(
          state.copyWith(
            status: FormsStatus.error,
            errorMessage:
                'Failed to insert recipe with status code: ${response.statusCode}',
          ),
        );
      }
    } catch (error) {
      throw Exception(error);
      emit(
        state.copyWith(
          status: FormsStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> _updateRecipe(
      UpdateRecipeEvent event, Emitter<RecipeState> emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    try {
      final Uri uri = Uri.parse(
          "https://imtihon-4oy-default-rtdb.europe-west1.firebasedatabase.app/recipe/${event.recipeModel.id}.json");
      final Response response = await put(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(event.recipeModel.toJson()),
      );

      if (response.statusCode == 200) {
        add(GetAllRecipeEvent());
      } else {
        emit(
          state.copyWith(
            status: FormsStatus.error,
            errorMessage:
                'Failed to update recipe with status code: ${response.statusCode}',
          ),
        );
      }
    } catch (error) {
      emit(
        state.copyWith(
          status: FormsStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> _deleteRecipe(
      DeleteRecipeEvent event, Emitter<RecipeState> emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    try {
      final Uri uri =
          Uri.parse("${AppConstants.baseUrl}recipe/${event.recipeUId}.json");
      final Response response = await delete(uri);
      if (response.statusCode == 200) {
        add(GetAllRecipeEvent());
      } else {
        emit(
          state.copyWith(
            status: FormsStatus.error,
            errorMessage: response.statusCode.toString(),
          ),
        );
      }
    } catch (error) {
      throw Exception(error);
      emit(
        state.copyWith(
          status: FormsStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> _getAllRecipe(
      GetAllRecipeEvent event, Emitter<RecipeState> emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    try {
      final Uri uri = Uri.parse("${AppConstants.baseUrl}recipe.json");
      final Response response = await get(uri);
      debugPrint("_____________________________ data keldi funksiya ishladi");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        List<RetseptModel> listRecipe = [];
        debugPrint("_____________________________ data keldi succes length ${data.length}");
        data.forEach((key, value) {
          RetseptModel retseptModel = RetseptModel.fromJson(value as Map<String, dynamic>);
          listRecipe.add(retseptModel);
        });

        debugPrint("_____________________________ data keldi fromJson length ${listRecipe.length}");

        emit(
          state.copyWith(
            status: FormsStatus.success,
            listRecipe: listRecipe,
          )
        );
      } else {
        debugPrint("_____________________________ data keldmadi status code length ${response.statusCode.toString()}");

        emit(
          state.copyWith(
            status: FormsStatus.error,
            errorMessage:
                'Failed to fetch recipes with status code: ${response.statusCode}',
          ),
        );
      }
    } catch (error) {
      emit(
        state.copyWith(
          status: FormsStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
