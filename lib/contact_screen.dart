
import 'package:flutter/material.dart';
import 'app_logo.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  static const navy = Color(0xFF0B1F4D);
  static const blue = Color(0xFF38BDF8);
  static const background = Color(0xFFF8FAFC);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void sendMessage() {
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        messageController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Thank you! Your message has been received.',
        ),
        backgroundColor: Colors.green,
      ),
    );

    nameController.clear();
    emailController.clear();
    messageController.clear();
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(35),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    navy,
                    Color(0xFF164A8A),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Column(
                children: [
                  AppLogo(height: 110),
                  SizedBox(height: 15),
                  Text(
                    'Get In Touch',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'We would love to hear from you.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Information',
                    style: TextStyle(
                      color: navy,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  contactInfo(
                    Icons.email_outlined,
                    'Email',
                    'Add your business email',
                  ),

                  contactInfo(
                    Icons.phone_outlined,
                    'Phone',
                    'Add your business phone number',
                  ),

                  contactInfo(
                    Icons.location_on_outlined,
                    'Location',
                    'Add your business location',
                  ),

                  const SizedBox(height: 25),

                  // Contact Form
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Send Us a Message',
                          style: TextStyle(
                            color: navy,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20),

                        buildLabel('Your Name'),
                        const SizedBox(height: 8),
                        buildTextField(
                          controller: nameController,
                          hint: 'Enter your name',
                          icon: Icons.person_outline,
                        ),

                        const SizedBox(height: 18),

                        buildLabel('Your Email'),
                        const SizedBox(height: 8),
                        buildTextField(
                          controller: emailController,
                          hint: 'Enter your email',
                          icon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        const SizedBox(height: 18),

                        buildLabel('Your Message'),
                        const SizedBox(height: 8),
                        TextField(
                          controller: messageController,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: 'Write your message...',
                            filled: true,
                            fillColor: background,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 22),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: sendMessage,
                            icon: const Icon(Icons.send),
                            label: const Text(
                              'Send Message',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: navy,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
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
                          '© MY GLOBE. All rights reserved.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget contactInfo(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
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
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: blue.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: navy,
              size: 25,
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
                    color: navy,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: navy,
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: navy),
        filled: true,
        fillColor: background,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
