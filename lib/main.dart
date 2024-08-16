import 'package:exam_5_oy/blocs/retsipe_bloc/recipe_bloc.dart';
import 'package:exam_5_oy/blocs/retsipe_bloc/recipe_event.dart';
import 'package:exam_5_oy/cubit/image_cubit/image_cubit.dart';
import 'package:exam_5_oy/ui/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/auth/auth_bloc.dart';
import 'blocs/theme_bloc/theme_event.dart';
import 'blocs/user_bloc/user_bloc.dart';
import 'data/services/services_locator.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUP();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ImageCubit()),
        BlocProvider(create: (_) =>
        RecipeBloc()
          ..add(GetAllRecipeEvent())),
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider(create: (_) {
          return AuthBloc();
        }),
        BlocProvider(create: (_) {
          return UserBloc();
        }),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Retseptlar Dasturi',
          theme: state.isTheme ? ThemeData.dark() : ThemeData.light(),
          home: const LoginScreen(),
        );
      },
    );
  }
}
