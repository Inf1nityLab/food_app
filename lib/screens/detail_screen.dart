// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:food_app/widgets/glass_container_widget.dart';
// import 'package:food_app/widgets/icon_button_widget.dart';
//
// class DetailsScreen extends StatefulWidget {
//   const DetailsScreen({super.key});
//
//   @override
//   State<DetailsScreen> createState() => _DetailsScreenState();
// }
//
// class _DetailsScreenState extends State<DetailsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.green,
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         leading: const GlassContainerWidget(
//           iconData: Icons.arrow_back_ios,
//           left: 10,
//         ),
//         title: const Text(
//           'Food details',
//           style: TextStyle(
//               fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         centerTitle: true,
//         actions: const [
//           GlassContainerWidget(
//             iconData: Icons.favorite_border_sharp,
//             left: 0,
//           ),
//           SizedBox(
//             width: 10,
//           )
//         ],
//       ),
//       body: Stack(
//         children: [
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: height * 0.65,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30)
//                 )
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.topCenter,
//             child: Padding(
//               padding:  EdgeInsets.only(top: height * 0.1),
//               child: CircleAvatar(
//                 radius: height * 0.17,
//                 backgroundImage: AssetImage('assets/food1.png'),
//               ),
//             ),
//           ),
//           Padding(
//             padding:  EdgeInsets.only(top: height * 0.47, left: 10, right: 10),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Column(
//                       children: [
//                         Text('Avacado Salad', style: TextStyle(
//                             fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
//                         Text('15.00', style: TextStyle(
//                             fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),)
//                       ],
//                     ),
//                     Container(
//                       height: 60,
//                       width: 130,
//                       decoration: BoxDecoration(
//                         color: Colors.green,
//                         borderRadius: BorderRadius.circular(15)
//                       ),
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           IconButtonWidget(iconData: Icons.remove, ),
//                           Text('1', style: TextStyle(
//                               fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
//                           IconButtonWidget(iconData: Icons.add)
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             )
//           )
//         ],
//       ),
//     );
//   }
// }
