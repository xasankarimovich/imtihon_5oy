import 'package:exam_5_oy/blocs/retsipe_bloc/recipe_bloc.dart';
import 'package:exam_5_oy/blocs/retsipe_bloc/recipe_state.dart';
import 'package:exam_5_oy/data/model/fomrs_status.dart';
import 'package:exam_5_oy/ui/widgets/custom_widget.dart';
import 'package:exam_5_oy/utils/image_path/images_path.dart';
import 'package:exam_5_oy/utils/style/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeCard extends StatefulWidget {
  const RecipeCard({super.key});

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Recipe Details'),

        ),
        body: Column(
          children: [
            // Recipe Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    AppImages.onChoco3,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
                Positioned(
                  bottom: 8.0,
                  left: 8.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 2.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 12.0),
                        const SizedBox(width: 4.0),
                        // Star rating or other content can be added here
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8.0,
                  right: 8.0,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite_border,
                            color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.share, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Chef Information
            Row(
              children: [
                const CircleAvatar(),
                const SizedBox(width: 8.0),
                const Text(
                  'Kelly Mayer',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.star, color: Colors.black, size: 12.0),
                      SizedBox(width: 4.0),
                      Text(
                        '4.8',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Recipe Title
            NameContainer(
              title: 'Perfect homemade pancake',
            ),
            const SizedBox(height: 16.0),
            TabBar(
              dividerColor: Colors.black,
              dividerHeight: 2,
              labelColor: Colors.red,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.red,
              indicatorWeight: 5,
              splashBorderRadius: BorderRadius.circular(10),
              tabs: [
                Tab(text: 'Preparation'),
                Tab(text: 'Ingredients'),
                Tab(text: 'Comments'),
              ],
            ),
            // TabBarView
            Expanded(

              child: TabBarView(
                children: [
                  // Preparation Page
                  BlocBuilder<RecipeBloc, RecipeState>(
                    builder: (context, state) {
                      if (state.status == FormsStatus.success) {
                        return ListView.builder(
                          itemCount: state.listRecipe.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                state.listRecipe[index].name,
                                style: AppTextStyle.medium,
                              ),
                            );
                          },
                        );
                      }
                      return Center(
                        child: CupertinoActivityIndicator(),
                      );
                    },
                  ),
                  // Ingredients Page
                  BlocBuilder<RecipeBloc, RecipeState>(
                    builder: (context, state) {
                      if (state.status == FormsStatus.success) {
                        return ListView.builder(
                          itemCount: state.listRecipe.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                state.listRecipe[index].id,
                                style: AppTextStyle.medium,
                              ),
                            );
                          },
                        );
                      }
                      return Center(
                        child: CupertinoActivityIndicator(),
                      );
                    },
                  ),
                  // Comments Page
                  BlocBuilder<RecipeBloc, RecipeState>(
                    builder: (context, state) {
                      if (state.status == FormsStatus.success) {
                        return ListView.builder(
                          itemCount: state.listRecipe.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                state.listRecipe[index].difficulty,
                                style: AppTextStyle.medium,
                              ),
                            );
                          },
                        );
                      }
                      return Center(
                        child: CupertinoActivityIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
