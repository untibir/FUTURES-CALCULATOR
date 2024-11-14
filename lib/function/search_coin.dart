// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/coin_provider.dart';

// Padding search_coin() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 10),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         SizedBox(
//           height: 50,
//           width: 250,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Consumer<CoinProvider>(
//               builder: (context, provider, child) {
//                 return TextField(
//                   style: const TextStyle(color: Colors.white),
//                   onChanged: (value) {
//                     provider.filterCoins(value);
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Search Coin...',
//                     hintStyle: const TextStyle(color: Colors.white),
//                     prefixIcon: const Icon(
//                       Icons.search,
//                       color: Colors.white,
//                     ),
//                     filled: true,
//                     fillColor: const Color(0xFF1C1C26),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
