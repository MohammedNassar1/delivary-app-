import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String selectedSize = 'Medium';
  int quantity = 1;
  bool chickenSelected = false;
  bool mushroomSelected = false;
  bool cheeseSelected = false;

  String productTitle = 'Melting Cheese Pizza';
  String productPrice = '\$10.99';
  String productImagePath = 'assets/images/pizza.png';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    if (args != null) {
      productTitle = args['title'] ?? productTitle;
      productPrice = args['price'] ?? productPrice;
      productImagePath = args['imagepath'] ?? productImagePath;
    }
    String numericPrice = productPrice.replaceAll(RegExp(r'[^\d.]'), '');
    double basePrice = double.tryParse(numericPrice) ?? 10.99;
    double totalPrice = basePrice * quantity;

    if (chickenSelected) totalPrice += 1.40;
    if (mushroomSelected) totalPrice += .40;
    if (cheeseSelected) totalPrice += 1.20;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, size: 20, color: Colors.black),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite_outline,
                size: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Color(0xfff6f6f6)),
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: double.infinity,
                      child: Center(
                        child: Image.asset(
                          productImagePath,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Pizza Italiano',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: Colors.grey[800],
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),
                                  Text(
                                    '4.5',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '(7.2k)',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            productTitle,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Size',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              buildSizeOption('8', '\$8.09', 'small'),
                              const SizedBox(width: 12),
                              buildSizeOption('12', '\$10.09', 'medium'),
                              const SizedBox(width: 12),
                              buildSizeOption('16', '\$12.09', 'large'),
                            ],
                          ),
                          const SizedBox(height: 32),
                          Text(
                            'Add Ingrediants',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          buildIngrediantItem(
                            'Chicken',
                            '\$1.40',
                            '250gm',
                            chickenSelected,
                            (value) => setState(() => chickenSelected = value),
                          ),
                          const SizedBox(height: 12),
                          buildIngrediantItem(
                            'Mushroom',
                            '\$.40',
                            '100gm',
                            mushroomSelected,
                            (value) => setState(() => mushroomSelected = value),
                          ),
                          const SizedBox(height: 12),
                          buildIngrediantItem(
                            'cheese',
                            '\$2.40',
                            '150gm',
                            cheeseSelected,
                            (value) => setState(() => cheeseSelected = value),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (quantity > 0) {
                              setState(() => quantity--);
                            }
                          },
                          icon: Icon(Icons.remove, size: 18),
                        ),
                        Text(
                          '$quantity',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () => setState(() => quantity++),
                          icon: Icon(Icons.add, size: 18),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Add to Cart -\$${totalPrice.toStringAsFixed(2)}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 25,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
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

  Widget buildSizeOption(String size, String price, String value) {
    bool isSelected = selectedSize == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedSize = value),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF1E3C72) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Color(0xFF1E3C72) : Colors.grey.shade200,
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                size,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: TextStyle(
                  color: isSelected ? Colors.white : Color(0xFF1E3C72),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIngrediantItem(
    String name,
    String price,
    String weight,
    bool isSelected,
    Function(bool) onChanged,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(
              'assets/images/burger.png',
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  weight,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: TextStyle(
              color: Color(0xFF1E3C72),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () => onChanged(!isSelected),
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF1E3C72) : Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: isSelected ? Color(0xFF1E3C72) : Colors.grey.shade300,
                ),
              ),
              width: 22,
              height: 22,
              child: isSelected
                  ? Icon(Icons.check, color: Colors.white, size: 14)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
