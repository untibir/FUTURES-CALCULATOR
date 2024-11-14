import 'package:flutter/material.dart';

Container my_balance_continer_home() {
  return Container(
    margin: const EdgeInsets.all(14),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFF0695FF),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Sol taraftaki metinler
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Balance',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '\$ 4,562.52',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Monthly Profit',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '+ \$1,562.52',
              style: TextStyle(
                color: Color(0xFF7BFFB2),
                fontSize: 16,
              ),
            ),
          ],
        ),

        Column(
          children: [
            const SizedBox(height: 99),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: const Color(0xFF7BFFB2).withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.trending_up, // Yüzde simgesi
                    color: Color(0xFF7BFFB2),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '+26%',
                    style: TextStyle(
                      color: Color(0xFF7BFFB2),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
