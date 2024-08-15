import 'package:exam_5_oy/ui/add_recipe_screen/add_recipe_screen.dart';
import 'package:exam_5_oy/ui/image_screen/image_screen.dart';
import 'package:exam_5_oy/utils/image_path/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/theme_bloc/theme_event.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        bool isDarkTheme = state.isTheme;

        return Drawer(
          backgroundColor: isDarkTheme ? Colors.black : Colors.white,
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: isDarkTheme ? Colors.grey[900] : Colors.blue,
                  image: DecorationImage(image: AssetImage( AppImages.onChoco3),fit: BoxFit.cover)
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Welcome, User!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildDrawerItem(
                      icon: Icons.home,
                      text: 'Home',
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => ImageScreen(),
                          ),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.cable_rounded,
                      text: 'My Event Screen',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const AddNewScreen(),
                          ),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.lightbulb,
                      text: 'Change Theme',
                      onTap: () {
                        bool isDarkTheme = !state.isTheme;
                        context.read<ThemeCubit>().checkTheme(isDarkTheme);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Add logout functionality or any other desired action
                  },
                  icon: const Icon(Icons.exit_to_app),
                  label: const Text('Logout'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDarkTheme ? Colors.grey[800] : Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    );
  }
}
