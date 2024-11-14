import 'package:flutter/material.dart';

class BottomNavProvider with ChangeNotifier {
  // Daha əvvəlki kodlar...

  int _selectedIndex = 0; // Yeni dəyişən
  int get selectedIndex => _selectedIndex; // Getter

  void setSelectedIndex(int index) {
    _selectedIndex = index; // Seçilmiş indeksi yenilə
    notifyListeners(); // Dinləyiciləri xəbərdar et
  }
}
