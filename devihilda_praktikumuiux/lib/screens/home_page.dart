import 'package:flutter/material.dart';
import 'package:devihilda_praktikumuiux/screens/cart_screen.dart';
import 'package:devihilda_praktikumuiux/screens/profile_screen.dart';
import 'package:devihilda_praktikumuiux/widgets/product_card.dart';
import 'package:devihilda_praktikumuiux/data/dummy_products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Cari produk impian...",
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            )
          : null,

      // ================= BODY =================
      body: _selectedIndex == 0
          ? Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Produk Terbaru",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: GridView.builder(
                      itemCount: dummyProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: dummyProducts[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : _selectedIndex == 1
              ? const CartScreen()
              : const ProfileScreen(),

      // ================= BOTTOM NAV =================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
