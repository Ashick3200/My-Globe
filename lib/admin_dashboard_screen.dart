
import 'package:flutter/material.dart';
import 'booking_data.dart';
import 'favorites_data.dart';
import 'app_logo.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() =>
      _AdminDashboardScreenState();
}

class _AdminDashboardScreenState
    extends State<AdminDashboardScreen> {
  static const navy = Color(0xFF0B1F4D);
  static const blue = Color(0xFF38BDF8);
  static const orange = Color(0xFFF59E0B);
  static const background = Color(0xFFF8FAFC);

  static const int totalPackages = 16;

  int get totalBookings => BookingData.bookings.length;

  int get totalFavorites => FavoritesData.favorites.length;

  double get totalRevenue {
    double total = 0;

    for (final booking in BookingData.bookings) {
      final price = booking['price'];

      if (price is num) {
        total += price.toDouble();
      }
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: navy,
        elevation: 0,
        centerTitle: true,
        title: const AppLogo(height: 48),
        actions: [
          IconButton(
            tooltip: 'Refresh',
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    navy,
                    Color(0xFF164A8A),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppLogo(height: 90),
                  SizedBox(height: 15),
                  Text(
                    'Welcome, Admin!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Manage your MY GLOBE travel platform.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Dashboard Overview',
              style: TextStyle(
                color: navy,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 18),

            // Statistics Cards
            LayoutBuilder(
              builder: (context, constraints) {
                final mobile = constraints.maxWidth < 600;
                final columns = mobile ? 2 : 4;

                return GridView.count(
                  crossAxisCount: columns,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: mobile ? 1.35 : 1.25,
                  children: [
                    buildStatCard(
                      'Packages',
                      '$totalPackages',
                      Icons.card_travel,
                      blue,
                    ),
                    buildStatCard(
                      'Bookings',
                      '$totalBookings',
                      Icons.book_online,
                      Colors.green,
                    ),
                    buildStatCard(
                      'Favorites',
                      '$totalFavorites',
                      Icons.favorite,
                      Colors.redAccent,
                    ),
                    buildStatCard(
                      'Revenue',
                      '\$${totalRevenue.toStringAsFixed(0)}',
                      Icons.attach_money,
                      orange,
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 32),

            // Recent Bookings
            const Text(
              'Recent Bookings',
              style: TextStyle(
                color: navy,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            if (BookingData.bookings.isEmpty)
              buildEmptyCard(
                Icons.event_busy,
                'No bookings available yet.',
              )
            else
              ...BookingData.bookings.reversed.take(5).map(
                (booking) {
                  return buildBookingCard(booking);
                },
              ),

            const SizedBox(height: 30),

            // Management Section
            const Text(
              'Management',
              style: TextStyle(
                color: navy,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            buildManagementCard(
              Icons.card_travel,
              'Package Management',
              'Total packages: $totalPackages',
            ),

            buildManagementCard(
              Icons.book_online,
              'Booking Management',
              'Total bookings: $totalBookings',
            ),

            buildManagementCard(
              Icons.favorite,
              'Favorites Management',
              'Saved packages: $totalFavorites',
            ),

            const SizedBox(height: 30),

            // Footer
            const Center(
              child: Column(
                children: [
                  AppLogo(height: 85),
                  SizedBox(height: 8),
                  Text(
                    'Fly Where Ever',
                    style: TextStyle(
                      color: navy,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Admin Dashboard',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 5),
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

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Statistics Card
  Widget buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 30,
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              color: navy,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  // Booking Card
  Widget buildBookingCard(
    Map<String, dynamic> booking,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFFE0F2FE),
            child: Icon(
              Icons.flight_takeoff,
              color: navy,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  booking['name']?.toString() ?? 'Travel Package',
                  style: const TextStyle(
                    color: navy,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${booking['location'] ?? 'Unknown'} • '
                  '${booking['travelers'] ?? 0} Travelers',
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Date: ${booking['date'] ?? 'Not selected'}',
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$${booking['price'] ?? 0}',
            style: const TextStyle(
              color: navy,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Empty State
  Widget buildEmptyCard(
    IconData icon,
    String message,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.grey,
          ),
          const SizedBox(height: 10),
          Text(
            message,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  // Management Card
  Widget buildManagementCard(
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: navy,
            size: 28,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: navy,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 16,
          ),
        ],
      ),
    );
  }
}
