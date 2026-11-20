
import 'package:flutter/material.dart';
import 'booking_success_screen.dart';
import 'booking_data.dart';
import 'app_logo.dart';

class BookingScreen extends StatefulWidget {
  final Map<String, dynamic> item;

  const BookingScreen({
    super.key,
    required this.item,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  static const navy = Color(0xFF0B1F4D);
  static const orange = Color(0xFFF59E0B);

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  int travelers = 1;
  DateTime? travelDate;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final price = widget.item['price'] as num;
    final total = price * travelers;

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
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Booking Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: navy,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              widget.item['name'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: navy,
              ),
            ),

            const SizedBox(height: 20),

            const Text('Full Name'),
            const SizedBox(height: 8),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            const Text('Email Address'),
            const SizedBox(height: 8),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            const Text('Travel Date'),
            const SizedBox(height: 8),

            OutlinedButton.icon(
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(
                    const Duration(days: 365),
                  ),
                );

                if (date != null) {
                  setState(() {
                    travelDate = date;
                  });
                }
              },
              icon: const Icon(Icons.calendar_month),
              label: Text(
                travelDate == null
                    ? 'Select Travel Date'
                    : '${travelDate!.day}/${travelDate!.month}/${travelDate!.year}',
              ),
            ),

            const SizedBox(height: 20),

            const Text('Number of Travelers'),
            const SizedBox(height: 8),

            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (travelers > 1) {
                      setState(() {
                        travelers--;
                      });
                    }
                  },
                  icon: const Icon(
                    Icons.remove_circle_outline,
                  ),
                ),

                Text(
                  '$travelers',
                  style: const TextStyle(fontSize: 18),
                ),

                IconButton(
                  onPressed: () {
                    setState(() {
                      travelers++;
                    });
                  },
                  icon: const Icon(
                    Icons.add_circle_outline,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Divider(),

            const SizedBox(height: 15),

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
              '\$$total / total',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: orange,
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  final booking = {
                    'name': widget.item['name'],
                    'location':
                        widget.item['location'] ?? 'Unknown',
                    'date': travelDate == null
                        ? 'Not selected'
                        : '${travelDate!.day}/${travelDate!.month}/${travelDate!.year}',
                    'travelers': travelers,
                    'price': total,
                    'status': 'Confirmed',
                  };

                  BookingData.bookings.add(booking);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BookingSuccessScreen(
                        item: widget.item,
                        name: nameController.text,
                        email: emailController.text,
                        travelDate: travelDate,
                        travelers: travelers,
                        total: total,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: orange,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'CONFIRM BOOKING',
                  style: TextStyle(
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
    );
  }
}
