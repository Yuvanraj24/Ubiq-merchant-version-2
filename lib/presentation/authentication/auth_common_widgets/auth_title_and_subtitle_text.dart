// import 'package:flutter/material.dart';
//
// class AuthTitleAndSubTitleText extends StatelessWidget {
//   final String title;
//   final String subTitle;
//   const AuthTitleAndSubTitleText({
//     super.key, required this.title, required this.subTitle,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(title,
//             style: Theme.of(context).textTheme.headlineMedium),
//         const SizedBox(height: AppSizes.sm),
//         Text(subTitle,
//             style: Theme.of(context).textTheme.bodyLarge!.apply(
//               color: Colors.grey.shade500
//             )),
//       ],
//     );
//   }
// }