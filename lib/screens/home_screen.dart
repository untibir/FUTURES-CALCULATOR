import 'package:flutter/material.dart'; // Flutter UI kitabxanasını əlavə edir.
import 'package:provider/provider.dart'; // Provider paketini əlavə edir (verilənləri idarə etmək üçün).
import '../appbarr/app_bar.dart'; // Xüsusi başlıq (AppBar) widgetini əlavə edir.
import '../appbarr/custom_bottom_navigation_bar.dart'; // Xüsusi alt naviqasiya çubuğunu əlavə edir.
import '../function/home_coin.dart';
import '../function/home_coin_scrol.dart';
import '../function/my_balance_continer_home.dart'; // İstifadəçi balans məlumatlarını göstərən funksiyanı əlavə edir.
import '../providers/bottom_nav_provider.dart'; // Alt naviqasiya çubuğu üçün təminatçını əlavə edir.

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarr(),
      backgroundColor: const Color(0xFF11101C),
      body: SingleChildScrollView(
        // Burada kaydırılabilir bir yapı ekliyoruz.
        child: Column(
          children: [
            my_balance_continer_home(), // İstifadəçi balans məlumatlarını göstərən widget çağırılır.
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'My Portfolio',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        'Monthly',
                        style: TextStyle(
                          color: Color(0xFF00F4C8),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Color(0xFF00F4C8),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: 160, // home_coin_scrol widget'ı için sabit yükseklik.
              child: home_coin_scrol(),
            ),
            const SizedBox(
              height: 20,
            ),
            home_coin(),
          ],
        ),
      ),
      bottomNavigationBar: Consumer<BottomNavProvider>(
        builder: (context, provider, child) {
          return CustomBottomNavigationBar(
            selectedIndex: provider.selectedIndex,
            onItemTapped: (index) {
              provider.setSelectedIndex(index);
            },
          );
        },
      ),
    );
  }
}
