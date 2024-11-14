import 'package:flutter/material.dart';

import '../models/coin.dart';
// Coin məlumatlarını yaradan funksiya

class coin_data_generate extends StatelessWidget {
  const coin_data_generate({
    super.key,
    required this.coin,
  });

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            coin.name,
            style: const TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 20),
          Text(
            coin.symbol.toUpperCase(),
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
