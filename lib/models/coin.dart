class Coin {
  final String id;
  final String symbol;
  final String name;
  final String imageUrl;
  double currentPrice;
  double? previousPrice; // Önceki fiyatı tutmak için alan
  double? priceChange1h; // 1 saatlik değişim
  double? priceChange3h; // 3 saatlik değişim
  double? priceChange24h; // 24 saatlik değişim
  double? priceChange3d; // 3 günlük değişim
  double? priceChange7d; // 7 günlük değişim
  double? priceChange1m; // 1 aylık değişim
  double? priceChange1y; // 1 yıllık değişim
  double? allTimeHigh; // Tüm zamanların en yüksek fiyatı

  Coin({
    required this.id,
    required this.symbol,
    required this.name,
    required this.imageUrl,
    required this.currentPrice,
    this.previousPrice, // Önceki fiyat için parametre
    this.priceChange1h,
    this.priceChange3h,
    this.priceChange24h,
    this.priceChange3d,
    this.priceChange7d,
    this.priceChange1m,
    this.priceChange1y,
    this.allTimeHigh,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      id: json['id'],
      symbol: json['symbol'].toUpperCase(),
      name: json['name'],
      imageUrl: json['image'],
      currentPrice: json['current_price'].toDouble(),
      previousPrice:
          json['previous_price']?.toDouble(), // Eğer varsa önceki fiyatı al
      priceChange1h: json['price_change_percentage_1h']?.toDouble(),
      priceChange3h: json['price_change_percentage_3h']?.toDouble(),
      priceChange24h: json['price_change_percentage_24h']?.toDouble(),
      priceChange3d: json['price_change_percentage_3d']?.toDouble(),
      priceChange7d: json['price_change_percentage_7d']?.toDouble(),
      priceChange1m: json['price_change_percentage_1m']?.toDouble(),
      priceChange1y: json['price_change_percentage_1y']?.toDouble(),
      allTimeHigh: json['ath']?.toDouble(),
    );
  }
}
