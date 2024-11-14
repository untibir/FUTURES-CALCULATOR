import 'package:flutter/material.dart';

AppBar AppBarr() {
  return AppBar(
    backgroundColor: const Color(0xFF11101C),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Profile Image
        const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://pasajblog.turkcell.com.tr/wp-content/uploads/2021/11/IB_API_P_3116587_c357faed-d02c-4a82-8dfc-59b8b13442ba.jpg',
              ),
              radius: 20,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gunay Nuriyev',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  'Hi Gunay',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        // Notification Icon
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          onPressed: () {
            // Add notification logic here
          },
        ),
      ],
    ),
  );
}
