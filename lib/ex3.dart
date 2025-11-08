import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.grey, // fixed AppBar color
      ),
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: Product.values.map((product) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ProductCard(product: product), // Use the new widget
              ),
            );
          }).toList(),
        ),
      ),
    ),
  ));
}

// Step 1: Product enum
enum Product {
  dart(
    'Dart',
    'The Best Object Language',
    'assets/ex3/dart.png',
  ),
  flutter(
    'Flutter',
    'The Best Mobile Widget Library',
    'assets/ex3/Flutter.png',
  ),
  firebase(
    'Firebase',
    'The Best Cloud Database',
    'assets/ex3/Firebase.png',
  );

  final String name;
  final String description;
  final String imagePath;

  const Product(this.name, this.description, this.imagePath);
}

// Step 2: ProductCard widget
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              product.description,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
