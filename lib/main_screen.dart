import 'package:delivary_app/pages/cart_page.dart';
import 'package:delivary_app/pages/home_page.dart';
import 'package:delivary_app/pages/wishlist_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int SelectedIndex = 0;

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: IndexedStack(
        index: SelectedIndex,

        children: [HomePage(), WishlistPage(), CartPage()],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 24, bottom: 24, right: 24),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 16,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavBarItem(
                icon: Icons.home,
                selected: SelectedIndex == 0,
                ontap: () => setState(() => SelectedIndex = 0),
              ),
              NavBarItem(
                icon: Icons.favorite_outline,
                selected: SelectedIndex == 1,
                ontap: () {
                  setState(() => SelectedIndex = 1);
                },
              ),
              NavBarItem(
                icon: Icons.shopping_cart_outlined,
                selected: SelectedIndex == 2,
                ontap: () => setState(() => SelectedIndex = 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final VoidCallback ontap;
  const NavBarItem({
    super.key,
    required this.icon,
    required this.selected,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? Color(0xFF1E3C72) : Colors.grey.shade400;
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Icon(icon, color: color, size: 28),
        padding: EdgeInsets.all(12),
        decoration: selected
            ? BoxDecoration(color: Color(0xFFE3E7F1), shape: BoxShape.circle)
            : null,
      ),
    );
  }
}
