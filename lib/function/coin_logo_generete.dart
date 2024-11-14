import 'package:flutter/material.dart';
// Logo yaradan funksiya

class coin_logo_generete extends StatelessWidget {
  const coin_logo_generete({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Image.network(imageUrl, width: 40, height: 40),
    );
  }
}
