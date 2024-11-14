import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/coin_provider.dart';
import 'coin_data_generate.dart';
import 'coin_logo_generete.dart';
import 'coin_price_generate.dart';
import 'qrafik_home.dart';

Widget home_coin() {
  TextEditingController searchController = TextEditingController();

  return Consumer<CoinProvider>(
    builder: (context, provider, child) {
      final coins = provider.filteredCoins; // Filtrelenmiş coinler

      // Arama filtresi
      void filterCoins(String query) {
        provider.filterCoins(
            query); // Bu metodun CoinProvider içinde olması gerekebilir
      }

      return SingleChildScrollView(
        // SingleChildScrollView ile her şeyin kaydırılabilir olmasını sağlıyoruz
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Column'un yüksekliğini sınırlamak için
          children: [
            // Arama çubuğu
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: searchController,
                onChanged: filterCoins,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Arama yapın...',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255)),
                  filled: true,
                  fillColor: const Color(0xFF1C1C26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),

            // ListView.builder içinde coinlerin gösterileceği kısım
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  200, // Yükseklik sınırlaması ekleniyor
              child: ListView.builder(
                itemCount: coins.length + 1, // Arama çubuğu eklediğimiz için +1
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // İlk index, arama çubuğu için
                    return const SizedBox
                        .shrink(); // Arama çubuğu zaten dışarıda olduğu için burada sadece boş bir alan döneriz
                  }

                  final coin =
                      coins[index - 1]; // Arama çubuğundan sonraki öğeleri al

                  return Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C26),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          coin_logo_generete(imageUrl: coin.imageUrl),
                          const SizedBox(width: 10),
                          coin_data_generate(coin: coin),
                          qrafik_home(coin: coin),
                          PriceInfo(coin: coin),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
