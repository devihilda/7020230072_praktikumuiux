import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // =================== KONTEN UTAMA ===================
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===== GAMBAR PRODUK =====
                Container(
                  height: 350,
                  width: double.infinity,
                  color: Colors.blue[50],
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 120,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),

                // ===== INFORMASI PRODUK =====
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nama Produk
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Harga Produk
                      Text(
                        product.price,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Judul Deskripsi
                      const Text(
                        "Deskripsi Produk",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Deskripsi Produk (DINAMIS)
                      Text(
                        product.description,
                        style: const TextStyle(color: Colors.grey, height: 1.5),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 100), // ruang untuk bottom bar
              ],
            ),
          ),

          // =================== TOMBOL BACK ===================
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),

          // =================== BOTTOM ACTION BAR ===================
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.chat_outlined,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Tambah ke Keranjang",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
