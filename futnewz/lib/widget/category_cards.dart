// import 'package:flutter/material.dart';
// import 'package:futnewz/theme.dart';

// class CategoryCard extends StatelessWidget {
//   final String image;
//   final String title;
//   final Function onTap;

//   const CategoryCard({Key key, this.image, this.title, this.onTap}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(image),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Text(
//           title,
//           softWrap: true,
//           style: kTitleCard,
//         ),
//         alignment: Alignment(-0.5, 0.5),
//       ),
//       onTap: onTap,
//     );
//   }
// }
