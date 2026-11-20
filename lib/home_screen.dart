
import 'package:flutter/material.dart';
import 'all_packages_screen.dart';
import 'my_bookings_screen.dart';
import 'about_screen.dart';
import 'contact_screen.dart';
import 'admin_dashboard_screen.dart';
import 'app_logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const navy = Color(0xFF0B1F4D);
  static const blue = Color(0xFF38BDF8);
  static const orange = Color(0xFFF59E0B);
  static const background = Color(0xFFF8FAFC);

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey destinationsKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  final TextEditingController searchController =
      TextEditingController();

  DateTime? travelDate;
  int travelers = 2;

  final List<Map<String, dynamic>> destinations = [
    {'name': 'Dubai', 'country': 'UAE', 'image': 'photo-1512453979798-5ea266f8880c'},
    {'name': 'Maldives', 'country': 'Indian Ocean', 'image': 'photo-1514282401047-d79a71a590e8'},
    {'name': 'Paris', 'country': 'France', 'image': 'photo-1502602898657-3e91760cbb34'},
    {'name': 'Thailand', 'country': 'Thailand', 'image': 'photo-1528181304800-259b08848526'},
    {'name': 'Kerala', 'country': 'India', 'image': 'photo-1602216056096-3b40cc0c9944'},
    {'name': 'Bahrain', 'country': 'Gulf', 'image': 'photo-1748066768504-99532da7d1e9'},
    {'name': 'Saudi Arabia', 'country': 'Gulf', 'image': 'photo-1784637729389-f24e1d2a8b22'},
    {'name': 'Qatar', 'country': 'Gulf', 'image': 'photo-1604433203862-93bc73b0f1e9'},
    {'name': 'Kuwait', 'country': 'Gulf', 'image': 'photo-1650563485505-50931328192a'},
    {'name': 'Oman', 'country': 'Gulf', 'image': 'photo-1755114422205-cefe80065ffd'},
    {'name': 'Goa', 'country': 'India', 'image': 'photo-1602216056096-3b40cc0c9944'},
    {'name': 'Agra', 'country': 'India', 'image': 'photo-1564507592333-c60657eea523'},
    {'name': 'Colombo', 'country': 'Sri Lanka', 'image': 'photo-1740812517101-fee71e001ebc'},
    {'name': 'Singapore', 'country': 'Singapore', 'image': 'photo-1525625293386-3f8f99389edd'},
    {'name': 'Sydney', 'country': 'Australia', 'image': 'photo-1506973035872-a4ec16b8e8d9'},
    {'name': 'New Zealand', 'country': 'New Zealand', 'image': 'photo-1469521669194-babb45599def'},
  ];

  final List<Map<String, dynamic>> packages = [
    {
      'name': 'Dubai City Tour',
      'location': 'Dubai, UAE',
      'days': '3 Days / 2 Nights',
      'price': '499',
      'rating': '4.9',
      'image': 'photo-1512453979798-5ea266f8880c',
    },
    {
      'name': 'Maldives Beach Escape',
      'location': 'Maldives',
      'days': '5 Days / 4 Nights',
      'price': '799',
      'rating': '5.0',
      'image': 'photo-1514282401047-d79a71a590e8',
    },
    {
      'name': 'Paris Romantic Tour',
      'location': 'Paris, France',
      'days': '4 Days / 3 Nights',
      'price': '699',
      'rating': '4.8',
      'image': 'photo-1502602898657-3e91760cbb34',
    },
    {
      'name': 'Thailand Adventure',
      'location': 'Thailand',
      'days': '5 Days / 4 Nights',
      'price': '599',
      'rating': '4.7',
      'image': 'photo-1528181304800-259b08848526',
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void scrollToSection(GlobalKey key) {
    final targetContext = key.currentContext;

    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  void openPackages() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AllPackagesScreen(),
      ),
    );
  }

  void openMyBookings() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyBookingsScreen(),
      ),
    );
  }

  void openAbout() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AboutScreen(),
      ),
    );
  }

  void openContact() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ContactScreen(),
      ),
    );
  }

  void openAdmin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AdminDashboardScreen(),
      ),
    );
  }

  void handleMobileMenu(String value) {
    switch (value) {
      case 'Home':
        scrollToSection(homeKey);
        break;
      case 'Packages':
        openPackages();
        break;
      case 'Destinations':
        scrollToSection(destinationsKey);
        break;
      case 'About Us':
        openAbout();
        break;
      case 'Contact':
        openContact();
        break;
      case 'My Bookings':
        openMyBookings();
        break;
      case 'Admin':
        openAdmin();
        break;
    }
  }

  Future<void> selectTravelDate() async {
    final selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(
        const Duration(days: 1),
      ),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 730),
      ),
    );

    if (selected != null) {
      setState(() => travelDate = selected);
    }
  }

  Widget destinationImage(String id) {
    return Image.network(
      'https://images.unsplash.com/$id?w=700&q=85&fit=crop',
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: const Color(0xFFE2E8F0),
          child: const Icon(
            Icons.landscape,
            size: 45,
            color: navy,
          ),
        );
      },
    );
  }

  Widget sectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: navy,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget buildHeader(bool mobile) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 18 : 55,
        vertical: 10,
      ),
      child: Row(
        children: [
          AppLogo(height: mobile ? 46 : 60),
          const Spacer(),

          if (!mobile) ...[
            _navItem('Home'),
            _navItem('Packages'),
            _navItem('Destinations'),
            _navItem('About Us'),
            _navItem('Contact'),
            _navItem('Admin'),
            const SizedBox(width: 15),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
              color: navy,
              tooltip: 'Favorites',
            ),
            OutlinedButton(
              onPressed: openMyBookings,
              child: const Text('My Bookings'),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: navy,
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: const Text('Sign In'),
            ),
          ] else
            PopupMenuButton<String>(
              tooltip: 'Navigation menu',
              icon: const Icon(
                Icons.menu,
                color: navy,
                size: 30,
              ),
              onSelected: handleMobileMenu,
              itemBuilder: (context) => const [
                PopupMenuItem(
                  value: 'Home',
                  child: ListTile(
                    leading: Icon(Icons.home_outlined),
                    title: Text('Home'),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                PopupMenuItem(
                  value: 'Packages',
                  child: ListTile(
                    leading: Icon(Icons.card_travel),
                    title: Text('Packages'),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                PopupMenuItem(
                  value: 'Destinations',
                  child: ListTile(
                    leading: Icon(Icons.place_outlined),
                    title: Text('Destinations'),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                PopupMenuItem(
                  value: 'About Us',
                  child: ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text('About Us'),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                PopupMenuItem(
                  value: 'Contact',
                  child: ListTile(
                    leading: Icon(Icons.contact_mail_outlined),
                    title: Text('Contact'),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                PopupMenuItem(
                  value: 'My Bookings',
                  child: ListTile(
                    leading: Icon(Icons.book_online_outlined),
                    title: Text('My Bookings'),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                PopupMenuItem(
                  value: 'Admin',
                  child: ListTile(
                    leading: Icon(Icons.admin_panel_settings_outlined),
                    title: Text('Admin'),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _navItem(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: () {
          switch (label) {
            case 'Home':
              scrollToSection(homeKey);
              break;
            case 'Packages':
              openPackages();
              break;
            case 'Destinations':
              scrollToSection(destinationsKey);
              break;
            case 'About Us':
              openAbout();
              break;
            case 'Contact':
              openContact();
              break;
            case 'Admin':
              openAdmin();
              break;
          }
        },
        child: Text(
          label,
          style: const TextStyle(
            color: navy,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget buildHero(bool mobile) {
    return SizedBox(
      key: homeKey,
      height: mobile ? 550 : 570,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=1800&q=90',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: navy,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  navy.withOpacity(0.88),
                  navy.withOpacity(0.55),
                  Colors.transparent,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mobile ? 22 : 65,
              vertical: 65,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Text(
                  'EXPLORE THE WORLD',
                  style: TextStyle(
                    color: orange,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Explore the World\nwith My Globe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: mobile ? 37 : 54,
                    height: 1.15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Discover unforgettable journeys\nand amazing destinations.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 17,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: mobile ? double.infinity : 720,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: mobile
                      ? Column(
                          children: [
                            _searchField(),
                            const Divider(),
                            _dateField(),
                            const Divider(),
                            _travelerField(),
                            const SizedBox(height: 12),
                            _searchButton(),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(child: _searchField()),
                            Container(
                              width: 1,
                              height: 45,
                              color: Colors.black12,
                            ),
                            Expanded(child: _dateField()),
                            Container(
                              width: 1,
                              height: 45,
                              color: Colors.black12,
                            ),
                            Expanded(child: _travelerField()),
                            const SizedBox(width: 12),
                            _searchButton(),
                          ],
                        ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchField() {
    return TextField(
      controller: searchController,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Where do you want to go?',
        labelText: 'Destination',
        prefixIcon: Icon(Icons.location_on_outlined),
      ),
    );
  }

  Widget _dateField() {
    return InkWell(
      onTap: selectTravelDate,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_month, color: navy),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Travel Date',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    travelDate == null
                        ? 'Select date'
                        : '${travelDate!.day}/${travelDate!.month}/${travelDate!.year}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: navy,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _travelerField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.people_outline, color: navy),
        const SizedBox(width: 7),
        const Text('Travelers'),
        IconButton(
          onPressed: () {
            if (travelers > 1) {
              setState(() => travelers--);
            }
          },
          icon: const Icon(Icons.remove_circle_outline),
        ),
        Text(
          '$travelers',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () => setState(() => travelers++),
          icon: const Icon(Icons.add_circle_outline),
        ),
      ],
    );
  }

  Widget _searchButton() {
    return ElevatedButton.icon(
      onPressed: () {
        final destination = searchController.text.trim();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              destination.isEmpty
                  ? 'Please enter a destination'
                  : 'Searching packages for $destination',
            ),
          ),
        );
      },
      icon: const Icon(Icons.search),
      label: const Text('Search'),
      style: ElevatedButton.styleFrom(
        backgroundColor: orange,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 18,
        ),
      ),
    );
  }

  Widget buildDestinations(bool mobile) {
    return Padding(
      key: destinationsKey,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 65,
        vertical: 55,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle(
            'Popular Destinations',
            'Discover beautiful places around the world.',
          ),
          const SizedBox(height: 28),
          LayoutBuilder(
            builder: (context, constraints) {
              final count = constraints.maxWidth > 1050
                  ? 5
                  : constraints.maxWidth > 650
                      ? 3
                      : 2;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: destinations.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: count,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: 0.95,
                ),
                itemBuilder: (context, index) {
                  final item = destinations[index];

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        destinationImage(item['image']),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black87,
                              ],
                              begin: Alignment.center,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 15,
                          bottom: 18,
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                item['country'],
                                style: const TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildPackages(bool mobile) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 65,
        vertical: 55,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle(
            'Featured Tour Packages',
            'Find your next unforgettable adventure.',
          ),
          const SizedBox(height: 28),
          LayoutBuilder(
            builder: (context, constraints) {
              final count = constraints.maxWidth > 1050
                  ? 4
                  : constraints.maxWidth > 650
                      ? 2
                      : 1;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: packages.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: count,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: count == 1 ? 1.05 : 0.76,
                ),
                itemBuilder: (context, index) {
                  final item = packages[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: background,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black12),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              destinationImage(item['image']),
                              Positioned(
                                top: 12,
                                right: 12,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Favorites feature coming soon',
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: navy,
                                  ),
                                ),
                                const SizedBox(height: 7),
                                Text(
                                  item['location'],
                                  style: const TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 7),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: orange,
                                      size: 17,
                                    ),
                                    Text(' ${item['rating']}'),
                                    const Spacer(),
                                    Text(
                                      item['days'],
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      '\$${item['price']}',
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: navy,
                                      ),
                                    ),
                                    const Text(
                                      ' / person',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: navy,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildWhyChooseUs(bool mobile) {
    final features = [
      [Icons.verified_user, 'Trusted Service', 'Reliable travel planning.'],
      [Icons.price_check, 'Best Prices', 'Great value for your trips.'],
      [Icons.support_agent, '24/7 Support', 'We are here to help.'],
      [Icons.flight_takeoff, 'Easy Booking', 'Simple booking experience.'],
    ];

    return Padding(
      key: aboutKey,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 65,
        vertical: 55,
      ),
      child: Column(
        children: [
          sectionTitle(
            'Why Choose My Globe?',
            'Making every journey comfortable and memorable.',
          ),
          const SizedBox(height: 30),
          LayoutBuilder(
            builder: (context, constraints) {
              final count = constraints.maxWidth > 850 ? 4 : 2;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: features.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: count,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: 1.7,
                ),
                itemBuilder: (context, index) {
                  final item = features[index];

                  return Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          item[0] as IconData,
                          color: orange,
                          size: 35,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item[1] as String,
                          style: const TextStyle(
                            color: navy,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          item[2] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildReviews(bool mobile) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 65,
        vertical: 55,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle(
            'What Our Travelers Say',
            'Experiences that inspire new journeys.',
          ),
          const SizedBox(height: 25),
          LayoutBuilder(
            builder: (context, constraints) {
              final reviews = [
                'Amazing experience! The booking process was simple and the trip was wonderful.',
                'Beautiful destinations and excellent customer service. Highly recommended!',
                'My family had a memorable holiday. We will travel with My Globe again.',
              ];

              return Wrap(
                spacing: 18,
                runSpacing: 18,
                children: List.generate(3, (index) {
                  return SizedBox(
                    width: constraints.maxWidth > 850
                        ? (constraints.maxWidth - 36) / 3
                        : constraints.maxWidth,
                    child: Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: background,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '★★★★★',
                            style: TextStyle(
                              color: orange,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            '"${reviews[index]}"',
                            style: const TextStyle(
                              height: 1.5,
                              color: navy,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Traveler ${index + 1}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: navy,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildFooter(bool mobile) {
    return Container(
      key: contactKey,
      width: double.infinity,
      color: navy,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 22 : 65,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppLogo(height: 90),
          const SizedBox(height: 15),
          const Text(
            'Your Journey, Our World.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Explore the world with unforgettable journeys.',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 30),
          const Divider(color: Colors.white24),
          const SizedBox(height: 15),
          const Text(
            '© 2026 My Globe. Portfolio Demo Project.',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final mobile = constraints.maxWidth < 750;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildHeader(mobile),
                buildHero(mobile),
                buildDestinations(mobile),
                buildPackages(mobile),
                buildWhyChooseUs(mobile),
                buildReviews(mobile),
                buildFooter(mobile),
              ],
            ),
          );
        },
      ),
    );
  }
}
