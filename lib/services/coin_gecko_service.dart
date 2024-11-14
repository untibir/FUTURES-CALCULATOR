import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../models/coin.dart';
import '../services/websocket_service.dart';

class CoinGeckoService {
  final Dio _dio = Dio();
  final String _apiUrl = 'https://api.coingecko.com/api/v3/coins/markets';

  CoinGeckoService() {
    (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<Map<String, Coin>> fetchCoins({required int page}) async {
    try {
      final response = await _dio.get(
        _apiUrl,
        queryParameters: {
          'vs_currency': 'usd',
          'order': 'market_cap_desc',
          'per_page': 250, // Sayfa başına maksimum coin sayısı
          'page': page,
          'sparkline': false,
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> coins = response.data;
        return {
          for (var coin in coins)
            coin['symbol'].toString().toUpperCase(): Coin.fromJson(coin),
        };
      } else {
        throw Exception('API başarısız: ${response.statusCode}');
      }
    } catch (e) {
      print('Hata: $e');
      throw Exception('API çağrısı başarısız: $e');
    }
  }
}

class CoinProvider with ChangeNotifier {
  final CoinGeckoService _coinGeckoService = CoinGeckoService();
  final WebSocketService _webSocketService = WebSocketService();
  Map<String, Coin> coinMap = {};
  int _currentPage = 1;
  bool _isLoading = false;

  CoinProvider() {
    _fetchAndMergeCoins();
    _listenToPriceUpdates();
  }

  Future<void> _fetchAndMergeCoins() async {
    if (_isLoading) return;
    _isLoading = true;

    try {
      final fetchedCoins =
          await _coinGeckoService.fetchCoins(page: _currentPage);
      coinMap.addAll(fetchedCoins);
      _currentPage++; // Bir sonraki sayfayı getirmek için sayfa numarasını artırıyoruz
      notifyListeners();
    } catch (e) {
      print('Hata: $e');
    } finally {
      _isLoading = false;
    }
  }

  void _listenToPriceUpdates() {
    _webSocketService.priceUpdates.listen((prices) {
      for (var symbol in prices.keys) {
        if (coinMap.containsKey(symbol)) {
          final priceData = prices[symbol];
          coinMap[symbol]!.currentPrice = priceData['price'];
          coinMap[symbol]!.priceChange1h = priceData['change1h'];
          coinMap[symbol]!.priceChange24h = priceData['change24h'];
          // Diğer değişim yüzdelerini burada güncelleyebilirsiniz.
        }
      }
      notifyListeners();
    });
  }

  Future<void> loadMoreCoins() async {
    await _fetchAndMergeCoins();
  }
}
