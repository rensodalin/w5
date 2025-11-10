import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text('Product'),
          backgroundColor: Colors.grey[100],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: Product.values.map((product) {
              return ProductCard(product: product);
            }).toList(),
          ),
        ),
      ),
    ),
  );
}

enum Product {
  dart(
    'Dart',
    'the best object languages.',
    'assets/ex3/dart.png',
  ),
  flutter(
    'Flutter',
    'the best mobile widget library..',
    'assets/ex3/flutter.png',
  ),
  firebase(
    'Firebase',
    'the best cloud database.',
    'assets/ex3/firebase.png',
  );

  final String title;
  final String description;
  final String imagePath;

  const Product(this.title, this.description, this.imagePath);
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.imagePath,
              height: 80,
            ),
            const SizedBox(height: 10),
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
