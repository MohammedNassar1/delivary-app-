import 'package:delivary_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static List<Map<String, String>> products = [
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
  static const List<Map<String, String>> categories = [
    {'emoji': '🥩', 'label': 'Meat'},
    {'emoji': '🍔', 'label': 'Fast Food'},
    {'emoji': '🍣', 'label': 'Sushi'},
    {'emoji': '🍹', 'label': 'Drinks'},
    {'emoji': '🍨', 'label': 'Dessert'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello 👋',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          'Mohamed',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                    color: Colors.black,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_outlined),
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 110,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,

                itemBuilder: (context, index) {
                  final Category = categories[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index == categories.length - 1 ? 0 : 16,
                    ),
                    child: CategoryItem(Category['emoji']!, Category['label']!),
                  );
                },
              ),
            ),
            SizedBox(height: 24),
            Container(
              clipBehavior: Clip.antiAlias,
              width: double.infinity,
              constraints: BoxConstraints(minHeight: 140),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),

              child: Stack(
                children: [
                  Positioned(
                    right: -20,
                    top: -20,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -20,
                    bottom: -20,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(24),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  'LIMITED OFFER',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                '30% OFF',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  letterSpacing: -0.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'On your first order',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                              SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Color(0xFF1E3C72),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      24,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  minimumSize: Size(0, 0),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  'Order Now',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 2,
                          child: Transform.translate(
                            offset: Offset(15, 0),
                            child: Image.asset(
                              'assets/images/chef.png',
                              width: 150,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Best Sellers',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E3C72),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),

            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 1.5,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  title: product['title'] ?? '',
                  price: product['price'] ?? '',
                  calories: product['calories'] ?? '',
                  time: product['time'] ?? '',
                  imagePath: product['imagePath'] ?? '',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget CategoryItem(String emoji, String label) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
              ),
            ],
          ),
          width: 80,
          height: 80,
          child: Center(child: Text(emoji, style: TextStyle(fontSize: 34))),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
