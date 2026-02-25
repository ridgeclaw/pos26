import 'package:flutter/material.dart';

class MainArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Sidebar - Categories
          Container(
            width: 200,
            color: const Color(0xFF1a1a1a),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0d0d0d),
                    border: Border(
                      bottom: BorderSide(
                        color: const Color(0xFF333333),
                        width: 1,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Mystore',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                // Categories List
                Expanded(
                  child: ListView.separated(
                    itemCount: categories.length,
                    separatorBuilder: (context, index) => Divider(
                      color: const Color(0xFF333333),
                      height: 1,
                    ),
                    itemBuilder: (context, index) => ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      leading: Icon(
                        categories[index]['icon'],
                        color: const Color(0xFF666666),
                        size: 20,
                      ),
                      title: Text(
                        categories[index]['name'],
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 14,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Color(0xFF333333),
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: Container(
              color: const Color(0xFFFFFFFF),
              child: Column(
                children: [
                  // Top Bar - Search and Sort
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      border: Border(
                        bottom: BorderSide(
                          color: const Color(0xFFE0E0E0),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                          color: Color(0xFF666666),
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Søk etter produkter...',
                              hintStyle: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 12),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: const Color(0xFFE0E0E0),
                            ),
                          ),
                          child: Text(
                            'Sortere etter: Alle',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Category Grid
                  Container(
                    height: 80,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      border: Border(
                        bottom: BorderSide(
                          color: const Color(0xFFE0E0E0),
                          width: 1,
                        ),
                      ),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: const Color(0xFFE0E0E0),
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    category['icon'],
                                    color: const Color(0xFF4CAF50),
                                    size: 28,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                category['name'],
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  // Products Grid
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.75,
                        children: products.map((product) {
                          return Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Product Image placeholder
                                Expanded(
                                  child: Container(
                                    color: Colors.grey[200],
                                    child: Center(
                                      child: Icon(
                                        Icons.inventory_2,
                                        color: Colors.grey[400],
                                        size: 48,
                                      ),
                                    ),
                                  ),
                                ),
                                // Product Info
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product['name'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'NOK ${product['price'].toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          color: Color(0xFF4CAF50),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Right Sidebar - Cart
          Container(
            width: 250,
            color: const Color(0xFF1a1a1a),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Cart Header
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0d0d0d),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFF333333),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kurv',
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'NOK 0.00',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Products Count
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0d0d0d),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFF333333),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Produkter',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Continue Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Fortsett to POS'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4CAF50),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Fortsett'),
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

// Categories data
final List<Map<String, dynamic>> categories = [
  {'name': 'Hjem', 'icon': Icons.home},
  {'name': 'Bøker', 'icon': Icons.book},
  {'name': 'Gavekort', 'icon': Icons.card_giftcard},
  {'name': 'Kjøtt', 'icon': Icons.eco},
  {'name': 'Oster', 'icon': Icons.set_meal}, // Oster means cheese in Norwegian
  {'name': 'Belysning', 'icon': Icons.lightbulb},
  {'name': 'Dekor', 'icon': Icons.palette},
  {'name': 'Gardiner', 'icon': Icons.vertical_split}, // Curtains
  {'name': 'Møbler', 'icon': Icons.chair}, // Furniture
  {'name': 'Tepper', 'icon': Icons.star}, // Belongings/charm
  {'name': 'Bukser', 'icon': Icons.inventory}, // Pants/clothing
  {'name': 'Interiør', 'icon': Icons.bedroom_parent}, // Interior
];

// Sample products
final List<Map<String, dynamic>> products = [
  {'name': 'Produkt 1', 'price': 299.00},
  {'name': 'Produkt 2', 'price': 149.00},
  {'name': 'Produkt 3', 'price': 399.00},
  {'name': 'Produkt 4', 'price': 199.00},
  {'name': 'Produkt 5', 'price': 299.00},
  {'name': 'Produkt 6', 'price': 249.00},
  {'name': 'Produkt 7', 'price': 399.00},
  {'name': 'Produkt 8', 'price': 179.00},
  {'name': 'Produkt 9', 'price': 229.00},
  {'name': 'Produkt 10', 'price': 349.00},
  {'name': 'Produkt 11', 'price': 189.00},
  {'name': 'Produkt 12', 'price': 279.00},
];

// Constants for dark theme colors
class AppColors {
  static const dark = Color(0xFF1a1a1a);
  static const darker = Color(0xFF0d0d0d);
  static const grey = Color(0xFF333333);
  static const lightGrey = Color(0xFF666666);
  static const white = Color(0xFFFFFFFF);
  static const offWhite = Color(0xFFF5F5F5);
  static const green = Color(0xFF4CAF50);
}