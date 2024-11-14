import 'package:flutter/material.dart';
import '../models/coin.dart';
import '../services/coin_gecko_service.dart';
import '../services/websocket_service.dart';

class CoinProvider with ChangeNotifier {
  final CoinGeckoService _coinGeckoService = CoinGeckoService();
  final WebSocketService _webSocketService = WebSocketService();
  Map<String, Coin> coinMap = {}; // Tüm coinlerin saklandığı harita
  List<Coin> _filteredCoins = []; // Arama sonuçlarını saklamak için liste
  int _currentPage = 1;
  bool _isLoading = false;

  CoinProvider() {
    _fetchAndMergeCoins();
    _listenToPriceUpdates();
  }

  // Filtrelenmiş coinler getter'ı. Arama yapılmazsa tüm coinleri döndürüyor.
  List<Coin> get filteredCoins =>
      _filteredCoins.isEmpty ? coinMap.values.toList() : _filteredCoins;

  // Coinleri coinGecko'dan çekip saklayan fonksiyon.
  Future<void> _fetchAndMergeCoins() async {
    if (_isLoading) return;
    _isLoading = true;

    try {
      final fetchedCoins =
          await _coinGeckoService.fetchCoins(page: _currentPage);
      for (var entry in fetchedCoins.entries) {
        if (!coinMap.containsKey(entry.key)) {
          coinMap[entry.key] = entry.value;
        }
      }
      _currentPage++;
      notifyListeners();
    } catch (e) {
      print('Hata: $e');
    } finally {
      _isLoading = false;
    }
  }

  // Coin fiyatları güncellendiğinde çağrılır
  void _listenToPriceUpdates() {
    _webSocketService.priceUpdates.listen((prices) {
      for (var symbol in prices.keys) {
        if (coinMap.containsKey(symbol)) {
          final priceData = prices[symbol];
          final coin = coinMap[symbol]!;

          // Fiyat değişikliğini kaydet
          coin.previousPrice = coin.currentPrice;
          coin.currentPrice = priceData['price'];
          coin.priceChange1h = priceData['change1h'];
          coin.priceChange24h = priceData['change24h'];
        }
      }
      notifyListeners();
    });
  }

  // Coinlerin adını ya da simgesini arayarak filtreleme yapan fonksiyon
  void filterCoins(String query) {
    if (query.isEmpty) {
      _filteredCoins = []; // Arama boşsa, filtrelenmiş coinleri sıfırla
    } else {
      _filteredCoins = coinMap.values.where((coin) {
        final nameLower = coin.name.toLowerCase();
        final symbolLower = coin.symbol.toLowerCase();
        final queryLower = query.toLowerCase();

        // Coinin adı ya da sembolü arama sorgusuyla eşleşiyorsa
        return nameLower.contains(queryLower) ||
            symbolLower.contains(queryLower);
      }).toList();
    }
    notifyListeners(); // Dinleyicilere bildirim gönder
  }

  Future<void> loadMoreCoins() async {
    await _fetchAndMergeCoins();
  }
}
