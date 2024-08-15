// import 'package:flutter/material.dart';
//
// class DishTypeButton extends StatefulWidget {
//   const DishTypeButton({super.key});
//
//   @override
//   State<DishTypeButton> createState() => _DishTypeButtonState();
// }
//
// class _DishTypeButtonState extends State<DishTypeButton> {
//   @override
//   Widget build(BuildContext context) {
//     return  Wrap(
//       spacing: 8.0,
//       children: options.map((option) {
//         return FilterChip(
//           label: Text(option),
//           selected: selectedOptions.contains(option),
//           onSelected: (selected) {
//             setState(() {
//               selected
//                   ? selectedOptions.add(option)
//                   : selectedOptions.remove(option);
//             });
//           },
//         );
//       }).toList(),
//     )
//   }
// }
