
import 'package:flutter/material.dart';
import 'package_details_screen.dart';
import 'favorites_data.dart';
import 'favorites_screen.dart';
import 'app_logo.dart';

class AllPackagesScreen extends StatefulWidget {
  const AllPackagesScreen({super.key});

  @override
  State<AllPackagesScreen> createState() =>
      _AllPackagesScreenState();
}

class _AllPackagesScreenState extends State<AllPackagesScreen> {
  static const navy = Color(0xFF0B1F4D);
  static const blue = Color(0xFF38BDF8);
  static const orange = Color(0xFFF59E0B);
  static const background = Color(0xFFF8FAFC);

  final TextEditingController searchController =
      TextEditingController();

  String selectedDestination = 'All';
  String selectedSort = 'Recommended';

  final List<String> destinations = [
    'All',
    'Dubai',
    'Maldives',
    'Paris',
    'Thailand',
    'Bahrain',
    'Saudi Arabia',
    'Qatar',
    'Kuwait',
    'Oman',
    'Kerala',
    'Goa',
    'Agra',
    'Colombo',
    'Singapore',
    'Sydney',
    'New Zealand',
  ];

  final List<Map<String, dynamic>> packages = [
    {
      'name': 'Dubai City Tour',
      'location': 'Dubai, UAE',
      'days': '3 Days / 2 Nights',
      'price': 499,
      'rating': '4.9',
      'image': 'photo-1512453979798-5ea266f8880c',
    },
    {
      'name': 'Maldives Beach Escape',
      'location': 'Maldives',
      'days': '5 Days / 4 Nights',
      'price': 799,
      'rating': '5.0',
      'image': 'photo-1514282401047-d79a71a590e8',
    },
    {
      'name': 'Paris Romantic Tour',
      'location': 'Paris, France',
      'days': '4 Days / 3 Nights',
      'price': 699,
      'rating': '4.8',
      'image': 'photo-1502602898657-3e91760cbb34',
    },
    {
      'name': 'Thailand Adventure',
      'location': 'Thailand',
      'days': '5 Days / 4 Nights',
      'price': 599,
      'rating': '4.7',
      'image': 'photo-1528181304800-259b08848526',
    },
    {
      'name': 'Bahrain City Escape',
      'location': 'Bahrain',
      'days': '2 Days / 1 Night',
      'price': 199,
      'rating': '4.6',
      'image': 'photo-1748066768504-99532da7d1e9',
    },
    {
      'name': 'Saudi Arabia Discovery',
      'location': 'Saudi Arabia',
      'days': '4 Days / 3 Nights',
      'price': 399,
      'rating': '4.7',
      'image': 'photo-1784637729389-f24e1d2a8b22',
    },
    {
      'name': 'Qatar City Holiday',
      'location': 'Qatar',
      'days': '3 Days / 2 Nights',
      'price': 299,
      'rating': '4.6',
      'image': 'photo-1604433203862-93bc73b0f1e9',
    },
    {
      'name': 'Kuwait City Tour',
      'location': 'Kuwait',
      'days': '2 Days / 1 Night',
      'price': 249,
      'rating': '4.5',
      'image': 'photo-1650563485505-50931328192a',
    },
    {
      'name': 'Oman Nature Escape',
      'location': 'Oman',
      'days': '4 Days / 3 Nights',
      'price': 449,
      'rating': '4.8',
      'image': 'photo-1755114422205-cefe80065ffd',
    },
    {
      'name': 'Kerala Backwater Tour',
      'location': 'Kerala, India',
      'days': '5 Days / 4 Nights',
      'price': 499,
      'rating': '4.8',
      'image': 'photo-1602216056096-3b40cc0c9944',
    },
    {
      'name': 'Goa Beach Holiday',
      'location': 'Goa, India',
      'days': '4 Days / 3 Nights',
      'price': 399,
      'rating': '4.7',
      'image': 'photo-1602216056096-3b40cc0c9944',
    },
    {
      'name': 'Agra Heritage Tour',
      'location': 'Agra, India',
      'days': '3 Days / 2 Nights',
      'price': 349,
      'rating': '4.8',
      'image': 'photo-1564507592333-c60657eea523',
    },
    {
      'name': 'Colombo City Escape',
      'location': 'Colombo, Sri Lanka',
      'days': '4 Days / 3 Nights',
      'price': 449,
      'rating': '4.6',
      'image': 'photo-1740812517101-fee71e001ebc',
    },
    {
      'name': 'Singapore Explorer',
      'location': 'Singapore',
      'days': '4 Days / 3 Nights',
      'price': 599,
      'rating': '4.9',
      'image': 'photo-1525625293386-3f8f99389edd',
    },
    {
      'name': 'Sydney Adventure',
      'location': 'Sydney, Australia',
      'days': '6 Days / 5 Nights',
      'price': 999,
      'rating': '4.8',
      'image': 'photo-1506973035872-a4ec16b8e8d9',
    },
    {
      'name': 'New Zealand Escape',
      'location': 'New Zealand',
      'days': '7 Days / 6 Nights',
      'price': 1299,
      'rating': '5.0',
      'image': 'photo-1469521669194-babb45599def',
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  bool isFavorite(Map<String, dynamic> item) {
    return FavoritesData.favorites.any(
      (favorite) => favorite['name'] == item['name'],
    );
  }

  void toggleFavorite(Map<String, dynamic> item) {
    setState(() {
      if (isFavorite(item)) {
        FavoritesData.favorites.removeWhere(
          (favorite) => favorite['name'] == item['name'],
        );
      } else {
        FavoritesData.favorites.add(
          Map<String, dynamic>.from(item),
        );
      }
    });
  }

  List<Map<String, dynamic>> get filteredPackages {
    List<Map<String, dynamic>> result =
        packages.where((item) {
      final name = item['name'].toString().toLowerCase();
      final location =
          item['location'].toString().toLowerCase();
      final query =
          searchController.text.trim().toLowerCase();

      final matchesSearch =
          name.contains(query) || location.contains(query);

      final matchesDestination =
          selectedDestination == 'All' ||
          location.contains(
            selectedDestination.toLowerCase(),
          );

      return matchesSearch && matchesDestination;
    }).toList();

    if (selectedSort == 'Price: Low to High') {
      result.sort(
        (a, b) => a['price'].compareTo(b['price']),
      );
    } else if (selectedSort == 'Price: High to Low') {
      result.sort(
        (a, b) => b['price'].compareTo(a['price']),
      );
    }

    return result;
  }

  // Header with My Globe logo
  Widget buildHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 18,
      ),
      child: Row(
        children: [
          const AppLogo(height: 55),
          const Spacer(),

          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritesScreen(),
                ),
              ).then((_) {
                if (mounted) {
                  setState(() {});
                }
              });
            },
            child: const Text(
              'Favorites',
              style: TextStyle(color: navy),
            ),
          ),

          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Back to Home',
              style: TextStyle(color: navy),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearchSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 40,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            navy,
            Color(0xFF123B78),
          ],
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Explore Our Tour Packages',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Find your perfect journey with My Globe.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 25),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 550,
            ),
            child: TextField(
              controller: searchController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Search destination or package...',
                prefixIcon: const Icon(
                  Icons.search,
                  color: navy,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilters() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Browse by Destination',
            style: TextStyle(
              color: navy,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),

          SizedBox(
            height: 42,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final destination = destinations[index];

                return ChoiceChip(
                  label: Text(destination),
                  selected:
                      selectedDestination == destination,
                  selectedColor: blue,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: selectedDestination == destination
                        ? navy
                        : Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                  onSelected: (_) {
                    setState(() {
                      selectedDestination = destination;
                    });
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 25),

          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 8,
            children: [
              const Text(
                'Available Packages',
                style: TextStyle(
                  color: navy,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Sort: '),
                  DropdownButton<String>(
                    value: selectedSort,
                    items: const [
                      DropdownMenuItem(
                        value: 'Recommended',
                        child: Text('Recommended'),
                      ),
                      DropdownMenuItem(
                        value: 'Price: Low to High',
                        child: Text('Price: Low to High'),
                      ),
                      DropdownMenuItem(
                        value: 'Price: High to Low',
                        child: Text('Price: High to Low'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedSort = value;
                        });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPackageCard(Map<String, dynamic> item) {
    return Card(
      color: Colors.white,
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  'https://images.unsplash.com/${item['image']}?w=700&q=85&fit=crop',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: const Color(0xFFE2E8F0),
                    child: const Icon(
                      Icons.landscape,
                      size: 55,
                      color: navy,
                    ),
                  ),
                ),

                Positioned(
                  top: 12,
                  right: 12,
                  child: Material(
                    color: Colors.white,
                    shape: const CircleBorder(),
                    child: IconButton(
                      tooltip: 'Add to Favorites',
                      onPressed: () {
                        toggleFavorite(item);

                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text(
                                isFavorite(item)
                                    ? '${item['name']} added to Favorites'
                                    : '${item['name']} removed from Favorites',
                              ),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                      },
                      icon: Icon(
                        isFavorite(item)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isFavorite(item)
                            ? Colors.red
                            : navy,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 4,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PackageDetailsScreen(item: item),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['location'],
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item['name'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: navy,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: orange,
                          size: 17,
                        ),
                        const SizedBox(width: 4),
                        Text(item['rating']),
                        const Spacer(),
                        Flexible(
                          child: Text(
                            item['days'],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 11,
                            ),
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
                            color: navy,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          ' / person',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 11,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward,
                          color: orange,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPackageGrid(bool mobile) {
    final items = filteredPackages;

    if (items.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(50),
        child: Center(
          child: Text(
            'No packages found. Try another search.',
            style: TextStyle(
              color: navy,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        int columns = 3;

        if (constraints.maxWidth < 600) {
          columns = 1;
        } else if (constraints.maxWidth < 950) {
          columns = 2;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          itemCount: items.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: mobile ? 0.95 : 0.95,
          ),
          itemBuilder: (context, index) {
            return buildPackageCard(items[index]);
          },
        );
      },
    );
  }

  // Footer with My Globe logo
  Widget buildFooter() {
    return Container(
      width: double.infinity,
      color: navy,
      padding: const EdgeInsets.all(30),
      child: const Column(
        children: [
          AppLogo(height: 85),
          SizedBox(height: 15),
          Text(
            'Your Journey, Our World.',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 15),
          Text(
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
                buildHeader(),
                buildSearchSection(),
                buildFilters(),
                buildPackageGrid(mobile),
                const SizedBox(height: 40),
                buildFooter(),
              ],
            ),
          );
        },
      ),
    );
  }
}
