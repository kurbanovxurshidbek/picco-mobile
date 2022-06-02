// import 'package:cat/seller/views/pages/announcement/search_page_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/search_page_provider.dart';
//
// class SixthBody extends StatelessWidget {
//   const SixthBody({Key? key}) : super(key: key);
//
//
//
//   @override
//   Widget build(BuildContext context) {
//   final provider =
//   context.select((AnnouncementProvider provider) => provider);
//     return ListView(
//       padding: const EdgeInsets.all(10.0),
//       physics: const BouncingScrollPhysics(),
//       children: [
//         Row(
//           children: [
//             IconButton(
//               onPressed: () {
//                 provider.pageController.previousPage(
//                   duration: const Duration(milliseconds: 500),
//                   curve: Curves.ease,
//                 );
//               },
//               icon: const Icon(Icons.arrow_back, size: 27),
//             ),
//             const SizedBox(width: 17),
//             const Text(
//               'Введите аддрес',
//               style: TextStyle(color: Colors.black, fontSize: 17),
//             ),
//           ],
//         ),
//         const SizedBox(height: 30.0),
//         SizedBox(
//           width: 1.sw,
//           child: DropdownButtonFormField<String>(
//             icon: const Icon(Icons.keyboard_arrow_down, size: 30),
//             iconEnabledColor: Colors.black54,
//             iconDisabledColor: Colors.grey,
//             decoration: InputDecoration(
//               contentPadding: const EdgeInsets.fromLTRB(10.0, 14.0, 10.0, 14.0),
//               labelText: 'Область',
//               labelStyle: TextStyle(
//                 color: Colors.grey.shade400,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: const BorderSide(color: Colors.grey)),
//               enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: const BorderSide(color: Colors.grey)),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: const BorderSide(color: Colors.grey)),
//             ),
//             value: provider.selectedOption,
//             items: provider.options
//                 .map(
//                   (e) => DropdownMenuItem<String>(
//                     value: e,
//                     child: Text(
//                       e,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 )
//                 .toList(),
//             onChanged: (option) {
//               provider.chooseOption(option!);
//             },
//           ),
//         ),
//         const SizedBox(height: 15.0),
//         SizedBox(
//           width: 1.sw,
//           child: DropdownButtonFormField<String>(
//             icon: const Icon(Icons.keyboard_arrow_down, size: 30),
//             iconEnabledColor: Colors.black54,
//             iconDisabledColor: Colors.grey,
//             decoration: InputDecoration(
//               contentPadding: const EdgeInsets.fromLTRB(10.0, 14.0, 10.0, 14.0),
//               labelText: 'Район/Город',
//               labelStyle: TextStyle(
//                 color: Colors.grey.shade400,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: const BorderSide(color: Colors.grey)),
//               enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: const BorderSide(color: Colors.grey)),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: const BorderSide(color: Colors.grey)),
//             ),
//             items: provider.options
//                 .map(
//                   (e) => DropdownMenuItem<String>(
//                     value: e,
//                     child: Text(
//                       e,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 )
//                 .toList(),
//             onChanged: (option) {
//               provider.chooseOption(option!);
//             },
//           ),
//         ),
//         const SizedBox(height: 15.0),
//         SizedBox(
//           width: 1.sw,
//           child: DropdownButtonFormField<String>(
//             icon: const Icon(Icons.keyboard_arrow_down, size: 30),
//             iconEnabledColor: Colors.black54,
//             iconDisabledColor: Colors.grey,
//             decoration: InputDecoration(
//               contentPadding: const EdgeInsets.fromLTRB(10.0, 14.0, 10.0, 14.0),
//               labelText: 'Улица',
//               labelStyle: TextStyle(
//                 color: Colors.grey.shade400,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: const BorderSide(color: Colors.grey)),
//               enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: const BorderSide(color: Colors.grey)),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: const BorderSide(color: Colors.grey)),
//             ),
//             items: provider.options
//                 .map(
//                   (e) => DropdownMenuItem<String>(
//                     value: e,
//                     child: Text(
//                       e,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 )
//                 .toList(),
//             onChanged: (option) {
//               provider.chooseOption(option!);
//             },
//           ),
//         ),
//         const SizedBox(height: 30.0),
//         Divider(color: Colors.grey.shade400, thickness: 2),
//         const SizedBox(height: 20.0),
//         const Text(
//           'Точное место',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//           ),
//         ),
//         const SizedBox(height: 20.0),
//         const Text(
//           'Вы можете показать, где именно находится жилье',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//         ),
//         const SizedBox(height: 20.0),
//         Container(
//           decoration: BoxDecoration(
//               borderRadius: const BorderRadius.vertical(
//                 top: Radius.circular(20.0),
//               ),
//               border: Border.all(color: Colors.grey.shade400, width: 3)),
//           child: const Image(
//             image: AssetImage(
//               'assets/images/map_view.png',
//             ),
//             fit: BoxFit.fitWidth,
//           ),
//         ),
//       ],
//     );
//   }
// }
