import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final WebSocketChannel _channel = WebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws/!ticker@arr'));

  Stream<Map<String, dynamic>> get priceUpdates => _channel.stream.map((event) {
        final data = jsonDecode(event) as List<dynamic>;
        final Map<String, dynamic> prices = {};

        for (var item in data) {
          final symbol = item['s'] as String;
          if (symbol.endsWith('USDT')) {
            final symbolWithoutUSDT = symbol.replaceAll('USDT', '');
            prices[symbolWithoutUSDT] = {
              'price': double.parse(item['c']),
              'change1h': double.parse(item['p']),
              'change3h': null, // Üç saatlik değişimi hesaplayın
              'change24h': double.parse(item['P']),
              'change3d': null, // Üç günlük değişimi hesaplayın
              'change7d': null, // Yedi günlük değişimi hesaplayın
              'change1m': null, // Bir aylık değişimi hesaplayın
              'change1y': null, // Bir yıllık değişimi hesaplayın
              'ath': double.parse(item['h']), // Tüm zamanların en yüksek fiyatı
            };
          }
        }
        return prices;
      });
}
