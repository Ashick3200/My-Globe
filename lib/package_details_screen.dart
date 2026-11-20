
import 'package:flutter/material.dart';
import 'booking_screen.dart';
import 'app_logo.dart';

class PackageDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const PackageDetailsScreen({
    super.key,
    required this.item,
  });

  static const navy = Color(0xFF0B1F4D);
  static const orange = Color(0xFFF59E0B);
  static const background = Color(0xFFF8FAFC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: navy,
        elevation: 0,
        title: const AppLogo(height: 48),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://images.unsplash.com/${item['image']}?w=1200&q=85&fit=crop',
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['location'],
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    item['name'],
                    style: const TextStyle(
                      color: navy,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      const Icon(Icons.star, color: orange),
                      const SizedBox(width: 5),
                      Text(item['rating']),
                      const SizedBox(width: 20),
                      const Icon(Icons.calendar_month, color: navy),
                      const SizedBox(width: 5),
                      Text(item['days']),
                    ],
                  ),

                  const SizedBox(height: 25),
                  const Divider(),
                  const SizedBox(height: 15),

                  const Text(
                    'Package Price',
                    style: TextStyle(
                      color: navy,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    '\$${item['price']} / person',
                    style: const TextStyle(
                      color: orange,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),
                  const Divider(),
                  const SizedBox(height: 15),

                  const Text(
                    'About This Package',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),
                  const SizedBox(height: 10),

                  const Text(
                    'Explore beautiful destinations and enjoy an unforgettable travel experience with My Globe.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    "What's Included",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),
                  const SizedBox(height: 15),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('✓ Hotel Accommodation'),
                      SizedBox(height: 12),
                      Text('✓ Daily Breakfast'),
                      SizedBox(height: 12),
                      Text('✓ Airport Transfers'),
                      SizedBox(height: 12),
                      Text('✓ Guided Sightseeing'),
                      SizedBox(height: 12),
                      Text('✓ Travel Assistance'),
                    ],
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BookingScreen(item: item),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: orange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'BOOK NOW',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 35),

                  const Center(
                    child: AppLogo(height: 85),
                  ),

                  const SizedBox(height: 10),

                  const Center(
                    child: Text(
                      'Fly Where Ever',
                      style: TextStyle(
                        color: navy,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
