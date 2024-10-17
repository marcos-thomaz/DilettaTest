import 'package:dilettatest/app/features/product/domain/entities/product.dart';
import 'package:dilettatest/app/features/product/presentation/components/molecules/product_list_item.dart';
import 'package:flutter/material.dart';

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        id: '1',
        name: 'Product 1',
        price: 29.99,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      Product(
        id: '2',
        name: 'Product 2',
        price: 19.99,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      Product(
        id: '3',
        name: 'Product 3',
        price: 49.99,
        imageUrl: 'https://via.placeholder.com/150',
      ),
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductListItem(product: products[index]);
        },
      ),
    );
  }
}
