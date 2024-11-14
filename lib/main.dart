import 'package:flutter/material.dart';
import 'package:kripto_takip/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'providers/bottom_nav_provider.dart';
import 'providers/coin_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CoinProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
