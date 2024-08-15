import 'package:exam_5_oy/cubit/image_cubit/image_cubit.dart';
import 'package:exam_5_oy/data/model/fomrs_status.dart';
import 'package:exam_5_oy/ui/widgets/custom_drawer.dart';
import 'package:exam_5_oy/ui/widgets/global_button.dart';
import 'package:exam_5_oy/utils/extension/extension.dart';
import 'package:exam_5_oy/utils/image_path/images_path.dart';
import 'package:exam_5_oy/utils/style/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../cubit/image_cubit/image_state.dart';
import '../add_recipe_screen/add_recipe_screen.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),

      appBar: AppBar(

        title: Text(
          "Rasmni tanlang",
          style: AppTextStyle.bold,
        ),
        actions: [
          IconButton(
            style: IconButton.styleFrom(
                backgroundColor: Colors.blueAccent.withOpacity(0.3)),
            onPressed: () {
              context
                  .read<ImageCubit>()
                  .insertImage(source: ImageSource.gallery);
            },
            icon: const Icon(
              Icons.add,
              size: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocConsumer<ImageCubit, ImageState>(
        builder: (BuildContext context, ImageState state) {
          if (state.status == FormsStatus.loading) {
            return const Center(
              child: CupertinoActivityIndicator(
                radius: 30,
                color: Colors.black,
              ),
            );
          }
          if (state.status == FormsStatus.error) {
            return Center(
              child: Text(
                state.errorMessage,
                style: AppTextStyle.bold,
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                30.boxH(),
                if (state.imagePath.isNotEmpty)
                  Image.network(
                    state.imagePath,
                    width: 500.w,
                    height: 500.h,
                  ),
                if (state.imagePath.isEmpty)
                  Image.asset(
                    AppImages.defaultRecipe,
                    width: 500.w,
                    height: 200.h,
                  ),
                20.boxH(),
                if (state.imagePath.isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      context
                          .read<ImageCubit>()
                          .editImage(imagePath: state.imagePath);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Rename",
                        style: AppTextStyle.bold,
                      ),
                    ),
                  ),
                const Spacer(),
                GlobalLoadingButton(
                  title: 'Next',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) {
                          return const AddNewScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
        listenWhen: (oldState, currentState) =>
            currentState.status == FormsStatus.success,
        listener: (BuildContext context, ImageState state) {},
      ),
    );
  }
}
