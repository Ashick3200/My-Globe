
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'app_logo.dart';

class BookingSuccessScreen extends StatelessWidget {
  final Map<String, dynamic> item;
  final String name;
  final String email;
  final DateTime? travelDate;
  final int travelers;
  final num total;

  const BookingSuccessScreen({
    super.key,
    required this.item,
    required this.name,
    required this.email,
    required this.travelDate,
    required this.travelers,
    required this.total,
  });

  static const navy = Color(0xFF0B1F4D);
  static const orange = Color(0xFFF59E0B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppLogo(height: 48),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: navy,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 25),

            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 90,
            ),

            const SizedBox(height: 20),

            const Text(
              'Booking Successful!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: navy,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            const Text(
              'Thank you for choosing My Globe.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 35),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Booking Summary',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text('Package: ${item['name']}'),

                  const SizedBox(height: 15),

                  Text('Name: $name'),

                  const SizedBox(height: 15),

                  Text('Email: $email'),

                  const SizedBox(height: 15),

                  Text(
                    'Travel Date: ${travelDate == null ? 'Not selected' : '${travelDate!.day}/${travelDate!.month}/${travelDate!.year}'}',
                  ),

                  const SizedBox(height: 15),

                  Text('Travelers: $travelers'),

                  const Divider(height: 30),

                  const Text(
                    'Total Price',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    '\$$total',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: orange,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: navy,
                  foregroundColor: Colors.white,
                ),
                child: const Text('BACK TO HOME'),
              ),
            ),

            const SizedBox(height: 35),

            const AppLogo(height: 85),

            const SizedBox(height: 10),

            const Text(
              'Fly Where Ever',
              style: TextStyle(
                color: navy,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
