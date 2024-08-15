// // import 'package:exam_5_oy/ui/image_screen/image_screen.dart';
// // import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// //
// // import '../add_recipe_screen/add_recipe_screen.dart';
// //
// // class TabBoxScreen extends StatefulWidget {
// //   @override
// //   _TabBoxScreenState createState() => _TabBoxScreenState();
// // }
// //
// // class _TabBoxScreenState extends State<TabBoxScreen> {
// //   int _selectedIndex = 0;
// //   List<Widget> tabItems = [
// //     const Center(child: Text("1")),
// //     const Center(child: Text("2")),
// //     const ImageScreen(),
// //     const AddNewScreen(),
// //   ];
// //   @override
// //   void initState() {
// //     super.initState();
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         body: Center(
// //           child: tabItems[_selectedIndex],
// //         ),
// //         bottomNavigationBar: FlashyTabBar(
// //           shadows: const [
// //             BoxShadow(
// //               offset: Offset.infinite,
// //               blurRadius: 3,
// //               spreadRadius: 10,
// //             )
// //           ],
// //           animationCurve: Curves.linear,
// //           selectedIndex: _selectedIndex,
// //           iconSize: 30,
// //           showElevation: false,
// //           onItemSelected: (index) => setState(() {
// //             _selectedIndex = index;
// //           }),
// //           items: [
// //             FlashyTabBarItem(
// //                 icon: const Icon(Icons.home),
// //                 title: const Text('Home'),
// //                 activeColor: Colors.lightBlue,
// //                 inactiveColor: Colors.red),
// //             FlashyTabBarItem(
// //                 icon: const Icon(Icons.search),
// //                 title: const Text('Search'),
// //                 activeColor: Colors.lightBlue,
// //                 inactiveColor: Colors.yellow),
// //             FlashyTabBarItem(
// //                 icon: const Icon(Icons.emoji_food_beverage_outlined),
// //                 title: const Text('Add new'),
// //                 activeColor: Colors.lightBlue,
// //                 inactiveColor: Colors.green),
// //             FlashyTabBarItem(
// //                 icon: const Icon(Icons.settings),
// //                 title: const Text('Profile'),
// //                 activeColor: Colors.lightBlue,
// //                 inactiveColor: Colors.purple),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../add_recipe_screen/add_recipe_screen.dart';
import '../asab_screen/intraduction_screen.dart';
import '../image_screen/image_screen.dart';
import 'custom_drawer.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({Key? key}) : super(key: key);

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const RecipeCard(),
    const Center(child: Text("2")),
    ImageScreen(),
    AddNewScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        elevation: 10,
        curveSize: 100,
        height: 70,
        activeColor: Colors.white,
        items: const [
          TabItem(
            icon: Icons.home,
            title: 'Home',
          ),
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(icon: Icons.no_food, title: 'Add Recipe'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

// import 'package:easy_localization/easy_localization.dart';
// import 'package:exam_5_oy/utils/extension/extension.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rive/rive.dart';
//
// class TabScreen extends StatefulWidget {
//   const TabScreen({super.key, this.index = 0});
//
//   final int index;
//
//   @override
//   State<TabScreen> createState() => _TabScreenState();
// }
//
// class _TabScreenState extends State<TabScreen> {
//   int activeIndex = 0;
//
//   bool hasInternet = true;
//   PageController pageController = PageController();
//
//   @override
//   void initState() {
//     activeIndex = widget.index;
//     super.initState();
//   }
//
//   late SMITrigger tapThisPlus;
//   late SMITrigger tapOtherPlus;
//
//   late SMITrigger tapThisHome;
//   late SMITrigger tapOtherHome;
//
//   late SMITrigger tapThisUser;
//   late SMITrigger tapOtherUser;
//
//   late SMITrigger tapThisQuestion;
//   late SMITrigger tapOtherQuestion;
//
//   StateMachineController getRiveController(Artboard artBoard) {
//     StateMachineController? stateMachineController =
//         StateMachineController.fromArtboard(artBoard, "State Machine 1");
//
//     artBoard.addController(stateMachineController!);
//     return stateMachineController;
//   }
//
//   bool isFirst = false;
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//         statusBarColor: Colors.black,
//         statusBarIconBrightness: Brightness.light,
//         statusBarBrightness: Brightness.light,
//         systemNavigationBarIconBrightness: Brightness.dark,
//         systemNavigationBarColor: Colors.black));
//
//     List<Widget> screens = [
//       const PageControl(key: ValueKey(0)),
//       AddHireScreen(
//         key: const ValueKey(1),
//         context: context,
//
//       ),
//       FeedbackScreen(key: const ValueKey(2), userModel: UserModel.initial),
//       ProfileScreen(key: const ValueKey(3), context: context),
//     ];
//
//     return MaterialApp(
//       localizationsDelegates: context.localizationDelegates,
//       supportedLocales: context.supportedLocales,
//       locale: context.locale,
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: AnimatedSwitcher(
//           duration: const Duration(milliseconds: 250),
//           transitionBuilder: (Widget child, Animation<double> animation) {
//             return FadeTransition(opacity: animation, child: child);
//           },
//           child: screens[activeIndex],
//         ),
//         resizeToAvoidBottomInset: true,
//         bottomNavigationBar: Theme(
//           data: Theme.of(context).copyWith(
//             highlightColor: Colors.transparent,
//             splashColor: Colors.transparent,
//           ),
//           child: BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             unselectedItemColor: CupertinoColors.systemGrey,
//             selectedFontSize: 10.h,
//             unselectedFontSize: 10.w,
//             selectedItemColor: CupertinoColors.activeBlue,
//             backgroundColor: CupertinoColors.white,
//             currentIndex: activeIndex,
//             useLegacyColorScheme: true,
//             onTap: (v) async {
//               if (v != 3) {
//                 tapOtherUser.fire();
//               } else if (v == 3) {
//                 tapThisUser.fire();
//               }
//               if (v != 2) {
//                 tapOtherQuestion.fire();
//               } else if (v == 2) {
//                 tapThisQuestion.fire();
//               }
//
//               if (v != 0) {
//                 tapOtherHome.fire();
//               } else if (v == 0) {
//                 tapThisHome.fire();
//               }
//               if (v != 1) {
//                 tapOtherPlus.fire();
//               } else if (v == 1) {
//                 tapThisPlus.fire();
//               }
//               setState(() {
//                 activeIndex = v;
//               });
//             },
//             items: [
//               BottomNavigationBarItem(
//                 label: "hires".tr(),
//                 icon: Transform.scale(
//                   scale: 1.05,
//                   child: SizedBox(
//                     width: 20.w,
//                     height: 20.h,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(100),
//                       child: Transform.scale(
//                         scale: 1.2,
//                         child: RiveAnimation.asset(
//                           "assets/rives/home.riv",
//                           useArtboardSize: false,
//                           onInit: (artboard) {
//                             StateMachineController controller =
//                                 getRiveController(artboard);
//                             tapThisHome =
//                                 controller.findSMI("tap_this") as SMITrigger;
//                             tapOtherHome =
//                                 controller.findSMI("tap_other") as SMITrigger;
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               BottomNavigationBarItem(
//                 label: "add_hire".tr(),
//                 icon: SizedBox(
//                   width: 20.w,
//                   height: 20.h,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(100),
//                     child: RiveAnimation.asset(
//                       "assets/rives/plus.riv",
//                       useArtboardSize: true,
//                       onInit: (artboard) {
//                         StateMachineController controller =
//                             getRiveController(artboard);
//                         tapThisPlus =
//                             controller.findSMI("tap_this") as SMITrigger;
//                         tapOtherPlus =
//                             controller.findSMI("tap_other") as SMITrigger;
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//               BottomNavigationBarItem(
//                 label: "help".tr(),
//                 icon: SizedBox(
//                   width: 20.w,
//                   height: 20.h,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(100),
//                     child: RiveAnimation.asset(
//                       "assets/rives/question_last.riv",
//                       useArtboardSize: true,
//                       onInit: (artboard) {
//                         StateMachineController controller =
//                             getRiveController(artboard);
//                         tapThisQuestion =
//                             controller.findSMI("tap_this") as SMITrigger;
//                         tapOtherQuestion =
//                             controller.findSMI("tap_other") as SMITrigger;
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//               BottomNavigationBarItem(
//                 label: "profile".tr(),
//                 icon: ClipRRect(
//                   borderRadius: BorderRadius.circular(100),
//                   child: Container(
//                     height: 20.h,
//                     width: 20.w,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       color: activeIndex == 3
//                           ? CupertinoColors.activeBlue
//                           : CupertinoColors.systemGrey,
//                     ),
//                     child: Center(
//                       child: SizedBox(
//                         width: 16.w,
//                         height: 16.h,
//                         child: RiveAnimation.asset(
//                           "assets/rives/user.riv",
//                           useArtboardSize: true,
//                           onInit: (artboard) {
//                             StateMachineController controller =
//                                 getRiveController(artboard);
//                             tapThisUser =
//                                 controller.findSMI("tap_this") as SMITrigger;
//                             tapOtherUser =
//                                 controller.findSMI("tap_other") as SMITrigger;
//                             setState(() {});
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
