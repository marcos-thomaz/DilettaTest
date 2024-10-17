import 'package:dilettatest/app/core/extensions/double_extension.dart';
import 'package:dilettatest/app/features/product/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final Product product;

  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(
          product.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(
          product.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.0),
            Text(
              product.price.toStringCurrency,
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
        trailing: Icon(Icons.favorite_border),
        onTap: () {
          // Handle item tap
        },
      ),
    );
  }
}
