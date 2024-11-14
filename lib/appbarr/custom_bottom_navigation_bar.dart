// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/splash_screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF11101C),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icon/home.svg',
            height: 24, // İkonun boyutu
            width: 24,

            color: selectedIndex == 0
                ? const Color(0xFF00F4C8)
                : const Color(0xFF838383), // Seçilmiş ikonun rəngi
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icon/wallet.svg',
            height: 24,
            width: 24,
            color: selectedIndex == 1
                ? const Color(0xFF00F4C8)
                : const Color(0xFF838383), // Seçilmiş ikonun rəngi
          ),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icon/convert.svg',
            height: 44,
            width: 44,
          ),
          label: ' ', // İkonu boş qoyuruq
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icon/statistic.svg',
            height: 24,
            width: 24,
            color: selectedIndex == 3
                ? const Color(0xFF00F4C8)
                : const Color(0xFF838383), // Seçilmiş ikonun rəngi
          ),
          label: 'Statistic',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icon/user.svg',
            height: 24,
            width: 24,
            color: selectedIndex == 4
                ? const Color(0xFF00F4C8)
                : const Color(0xFF838383), // Seçilmiş ikonun rəngi
          ),
          label: 'User',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: const Color(0xFF00F4C8), // Seçilmiş ikonun rəngi
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      onTap: onItemTapped,
      selectedLabelStyle: const TextStyle(
        color: Color(0xFF00F4C8), // Seçilmiş yazının rəngi
        fontSize: 12, // Seçilmiş yazının boyutu
      ),
      unselectedLabelStyle: const TextStyle(
        color: Colors.grey, // Seçilməmiş yazının rəngi
        fontSize: 12, // Seçilməmiş yazının boyutu
      ),
    );
  }
}

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}

class ConvertPage extends StatelessWidget {
  const ConvertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Convert Page"));
  }
}

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Statistic Page"));
  }
}

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("User Page"));
  }
}
