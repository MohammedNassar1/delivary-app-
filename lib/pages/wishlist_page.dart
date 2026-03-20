import 'package:delivary_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});
  static List<Map<String, String>> WishListProducts = [
    {
      'title': 'Melting Cheese Pizza',
      'price': '\$10.99',
      'calories': '44 Calories',
      'time': '20 min',
      'imagePath': 'assets/images/pizza.png',
    },
    {
      'title': 'Melting burgar',
      'price': '\$10.99',
      'calories': '44 Calories',
      'time': '20 min',
      'imagePath': 'assets/images/burger.png',
    },
    {
      'title': 'Melting  Sanwatches',
      'price': '\$10.99',
      'calories': '44 Calories',
      'time': '20 min',
      'imagePath': 'assets/images/sanwatch.png',
    },
    {
      'title': 'Melting Botates',
      'price': '\$10.99',
      'calories': '44 Calories',
      'time': '20 min',
      'imagePath': 'assets/images/botates.png',
    },
    {
      'title': 'Melting Cheese Pizza',
      'price': '\$10.99',
      'calories': '44 Calories',
      'time': '20 min',
      'imagePath': 'assets/images/pizza.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff6f6f6),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Wishlist',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: WishListProducts.isEmpty
              ? Center(
                  child: Text(
                    'there is not items',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : GridView.builder(
                  itemCount: WishListProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.66,
                  ),
                  itemBuilder: (context, index) {
                    final product = WishListProducts[index];
                    return ProductCard(
                      title: product['title'] ?? '',
                      price: product['price'] ?? '',
                      calories: product['calories'] ?? '',
                      time: product['time'] ?? '',
                      imagePath: product['imagePath'] ?? '',
                    );
                  },
                ),
        ),
      ),
    );
  }
}
