
import 'package:flutter/material.dart';
import 'favorites_data.dart';
import 'package_details_screen.dart';
import 'app_logo.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() =>
      _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  static const navy = Color(0xFF0B1F4D);
  static const orange = Color(0xFFF59E0B);

  @override
  Widget build(BuildContext context) {
    final favorites = FavoritesData.favorites;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      appBar: AppBar(
        title: const AppLogo(height: 48),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: navy,
        elevation: 0,
      ),

      body: favorites.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 70,
                    color: Colors.black26,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'No Favorites Yet',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Save your favorite travel packages here.',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final columns =
                          constraints.maxWidth < 600 ? 1 : 2;

                      return GridView.builder(
                        padding: const EdgeInsets.all(20),
                        itemCount: favorites.length,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 1.15,
                        ),
                        itemBuilder: (context, index) {
                          final item = favorites[index];

                          return Card(
                            color: Colors.white,
                            clipBehavior: Clip.antiAlias,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Image.network(
                                        'https://images.unsplash.com/${item['image']}?w=700&q=85&fit=crop',
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (_, __, ___) =>
                                                const Icon(
                                          Icons.landscape,
                                          size: 50,
                                          color: navy,
                                        ),
                                      ),
                                      Positioned(
                                        top: 5,
                                        right: 5,
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              FavoritesData
                                                  .favorites
                                                  .removeWhere(
                                                (favorite) =>
                                                    favorite[
                                                        'name'] ==
                                                    item['name'],
                                              );
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['location'],
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(height: 5),

                                        Text(
                                          item['name'],
                                          maxLines: 1,
                                          overflow:
                                              TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: navy,
                                            fontWeight:
                                                FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),

                                        const Spacer(),

                                        Row(
                                          children: [
                                            Text(
                                              '\$${item['price']}',
                                              style: const TextStyle(
                                                color: navy,
                                                fontSize: 20,
                                                fontWeight:
                                                    FontWeight.bold,
                                              ),
                                            ),
                                            const Spacer(),

                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder:
                                                        (context) =>
                                                            PackageDetailsScreen(
                                                      item: item,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child:
                                                  const Text('View'),
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
                ),
              ],
            ),

      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppLogo(height: 65),
            SizedBox(height: 5),
            Text(
              'Fly Where Ever',
              style: TextStyle(
                color: navy,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
