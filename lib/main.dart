import 'package:exam_5_oy/blocs/retsipe_bloc/recipe_bloc.dart';
import 'package:exam_5_oy/blocs/retsipe_bloc/recipe_event.dart';
import 'package:exam_5_oy/cubit/image_cubit/image_cubit.dart';
import 'package:exam_5_oy/ui/widgets/tab_box.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/theme_bloc/theme_event.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>ImageCubit()),
        BlocProvider(create: (_)=>RecipeBloc()..add(GetAllRecipeEvent())),
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Retseptlar Dasturi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabBoxScreen(),
    );
  }
}
