import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/coin_provider.dart';
import 'coin_logo_generete.dart';
import 'qrafik_home.dart';

Expanded home_coin_scrol() {
  return Expanded(
    child: Consumer<CoinProvider>(
      builder: (context, provider, child) {
        final coins = provider.coinMap.values.toList();
        return ListView.builder(
          scrollDirection: Axis.horizontal, // Sağdan sola swrwsdwrme
          itemCount: coins.length,
          itemBuilder: (context, index) {
            final coin = coins[index];
            return Container(
              width: 190,
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C26),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        coin_logo_generete(imageUrl: coin.imageUrl),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              coin.symbol.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                      child: qrafik_home(coin: coin),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${coin.currentPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${coin.priceChange24h?.toStringAsFixed(2)}%',
                          style: TextStyle(
                            fontSize: 13,
                            color: (coin.priceChange24h != null &&
                                    coin.priceChange24h! > 0)
                                ? const Color(0xFF7BFFB2)
                                : const Color(0xFFDC1010),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
