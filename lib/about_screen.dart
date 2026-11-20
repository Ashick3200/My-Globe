
import 'package:flutter/material.dart';
import 'app_logo.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const navy = Color(0xFF0B1F4D);
  static const blue = Color(0xFF38BDF8);
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
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 35,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [navy, Color(0xFF164A8A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Column(
                children: [
                  AppLogo(height: 130),
                  SizedBox(height: 15),
                  Text(
                    'Fly Where Ever',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // About Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Who We Are',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),
                  const SizedBox(height: 12),

                  const Text(
                    'MY GLOBE is a travel booking platform '
                    'designed to help people explore destinations '
                    'and discover travel packages in one place. '
                    'Our goal is to make travel planning simple '
                    'and convenient.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.7,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'What We Offer',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),

                  const SizedBox(height: 18),

                  buildFeature(
                    Icons.flight,
                    'Travel Packages',
                    'Explore different destinations and packages.',
                  ),

                  buildFeature(
                    Icons.favorite,
                    'Favorites',
                    'Save your favorite travel packages.',
                  ),

                  buildFeature(
                    Icons.book_online,
                    'Easy Booking',
                    'Choose a package and manage your bookings.',
                  ),

                  buildFeature(
                    Icons.explore,
                    'Explore Destinations',
                    'Discover places around the world.',
                  ),

                  const SizedBox(height: 30),

                  // Mission Section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.black12,
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.flag,
                          color: orange,
                          size: 35,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Our Mission',
                          style: TextStyle(
                            color: navy,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'To make discovering and planning '
                          'your next journey easier through a '
                          'simple and user-friendly experience.',
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.6,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  // Footer
                  const Center(
                    child: Column(
                      children: [
                        AppLogo(height: 90),
                        SizedBox(height: 8),
                        Text(
                          'Fly Where Ever',
                          style: TextStyle(
                            color: navy,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          '© MY GLOBE. All rights reserved.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildFeature(
    IconData icon,
    String title,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: blue.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: navy,
              size: 27,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: navy,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
