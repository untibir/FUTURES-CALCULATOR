// price_info.dart
import 'package:flutter/material.dart'; // Flutter UI elementləri üçün material kitabxanasını əlavə edir.
import '../models/coin.dart'; // Coin modeli ilə işləmək üçün coin modelini əlavə edir.

class PriceInfo extends StatelessWidget {
  // `PriceInfo` adlı statik widget sinfi yaradır.
  final Coin coin; // `coin` adlı, göstəriləcək kriptovalyuta məlumatı.

  const PriceInfo({
    super.key,
    required this.coin, // `coin` parametri tələb olunur.
  });

  @override
  Widget build(BuildContext context) {
    // `build` metodu ilə widgetin görünüşünü qurur.
    Color priceColor = _getPriceColor(
        coin); // Qiymət rəngini `_getPriceColor` funksiyası ilə təyin edir.

    return Column(
      // Məlumatları şaquli yerləşdirmək üçün Column widgetindən istifadə edir.
      crossAxisAlignment:
          CrossAxisAlignment.end, // Elementləri sağ tərəfə hizalayır.
      children: [
        const SizedBox(height: 12), // Yuxarıda boşluq.
        Text(
          _formatPrice(coin
              .currentPrice), // Qiyməti `_formatPrice` funksiyası ilə formatlayır.
          style: TextStyle(
            color:
                priceColor, // Qiymətin rəngi `priceColor` dəyərinə uyğun olaraq təyin edilir.
            fontSize: _getFontSize(coin
                .currentPrice), // Font ölçüsü `_getFontSize` funksiyasından gəlir.
          ),
        ),
        const SizedBox(
            height: 1), // Qiymət və dəyişiklik arasında kiçik boşluq.
        Text(
          '${coin.priceChange24h?.toStringAsFixed(2)}%', // 24 saatlıq dəyişiklik faizini iki rəqəmlə göstərir.
          style: TextStyle(
            fontSize: 13, // Font ölçüsü 13 olaraq təyin edilir.
            color: (coin.priceChange24h != null &&
                    coin.priceChange24h! > 0) // Dəyişiklik müsbətdirsə:
                ? const Color(0xFF7BFFB2) // Yaşıl rəng göstərir.
                : const Color(0xFFDC1010), // Əks halda qırmızı rəng göstərir.
          ),
        ),
      ],
    );
  }

  // Qiymət rəngini təyin edən funksiya
  Color _getPriceColor(Coin coin) {
    if (coin.previousPrice != null) {
      // Əgər əvvəlki qiymət varsa:
      if (coin.currentPrice > coin.previousPrice!) {
        // Əgər cari qiymət əvvəlki qiymətdən yüksəkdirsə:
        return const Color(0xFF7BFFB2); // Yaşıl rəng göstərir.
      } else if (coin.currentPrice < coin.previousPrice!) {
        // Əgər cari qiymət əvvəlki qiymətdən aşağıdırsa:
        return const Color(0xFFDC1010); // Qırmızı rəng göstərir.
      }
    }
    return Colors.white; // Əvvəlki qiymət yoxdursa, ağ rəng göstərir.
  }

  // Qiyməti formatlayan funksiya
  String _formatPrice(double price) {
    String priceString =
        price.toStringAsFixed(8); // Qiyməti 8 onluqla formatlayır.
    priceString = priceString.replaceAll(
        RegExp(r'0+$'), ''); // Sonda olan sıfırları silir.
    priceString = priceString.replaceAll(
        RegExp(r'\.$'), ''); // Əgər sonda nöqtə qalarsa, onu da silir.
    return '\$$priceString'; // Qiyməti dollar simvolu ilə birlikdə qaytarır.
  }

  // Font ölçüsünü təyin edən funksiya
  double _getFontSize(double price) {
    String priceString = price.toString(); // Qiyməti string şəklində alır.
    int length = priceString.length; // String uzunluğunu müəyyən edir.

    if (length > 9) return 16; // Əgər 9 simvoldan uzundursa, font ölçüsü 16.
    if (length > 6) return 18; // Əgər 6-9 simvol arasındadırsa, font ölçüsü 18.
    if (length > 3) return 20; // Əgər 3-6 simvol arasındadırsa, font ölçüsü 20.
    return 22; // Əks halda font ölçüsü 22.
  }
}
