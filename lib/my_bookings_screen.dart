
import 'package:flutter/material.dart';
import 'booking_data.dart';
import 'app_logo.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  static const navy = Color(0xFF0B1F4D);
  static const orange = Color(0xFFF59E0B);

  @override
  Widget build(BuildContext context) {
    final bookings = BookingData.bookings;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      appBar: AppBar(
        title: const AppLogo(height: 48),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: navy,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Travel Bookings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: navy,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'View and manage your trips with My Globe.',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 25),

            if (bookings.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Icon(
                        Icons.luggage_outlined,
                        size: 60,
                        color: Colors.black26,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'No Bookings Yet',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: navy,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Your confirmed trips will appear here.',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            else
              ...bookings.reversed.map((booking) {
                return buildBookingCard(booking);
              }),

            const SizedBox(height: 30),

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
    );
  }

  Widget buildBookingCard(Map<String, dynamic> booking) {
    final bool confirmed = booking['status'] == 'Confirmed';

    return Card(
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    booking['name'] ?? 'Unknown Package',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: confirmed
                        ? Colors.green.shade50
                        : Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    booking['status'] ?? 'Pending',
                    style: TextStyle(
                      color: confirmed ? Colors.green : orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: orange,
                  size: 18,
                ),
                const SizedBox(width: 5),
                Text(booking['location'] ?? 'Unknown'),
              ],
            ),

            const Divider(height: 30),

            bookingInfo(
              Icons.calendar_month,
              'Travel Date',
              booking['date'] ?? 'Not selected',
            ),

            const SizedBox(height: 14),

            bookingInfo(
              Icons.people,
              'Travelers',
              '${booking['travelers'] ?? 1}',
            ),

            const SizedBox(height: 14),

            bookingInfo(
              Icons.payments,
              'Total Price',
              '\$${booking['price'] ?? 0}',
            ),
          ],
        ),
      ),
    );
  }

  Widget bookingInfo(
    IconData icon,
    String label,
    String value,
  ) {
    return Row(
      children: [
        Icon(icon, color: navy, size: 19),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: navy,
          ),
        ),
      ],
    );
  }
}
