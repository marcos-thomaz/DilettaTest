import 'package:cached_network_image/cached_network_image.dart';
import 'package:dilettatest/app/core/extensions/double_extension.dart';
import 'package:dilettatest/app/features/product/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final Product product;

  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CachedNetworkImage(
          height: 80,
          width: 80,
          imageUrl: product.image,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        title: Text(
          product.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4.0),
            Text(
              product.category,
              style: const TextStyle(fontSize: 11),
            ),
            const SizedBox(height: 4.0),
            Text(
              product.price.toStringCurrency,
              style: const TextStyle(color: Colors.green),
            ),
          ],
        ),
        trailing: const Icon(Icons.favorite_border),
        onTap: () {
          // Handle item tap
        },
      ),
    );
  }
}
