import 'package:dilettatest/app/features/product/presentation/pages/products_list_screen.dart';
import 'package:flutter/material.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🏷️ CompreFácil App'),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.search,
              size: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Badge.count(
              count: 10,
              child: const Icon(
                Icons.favorite,
                size: 24,
              ),
            ),
          ),
        ],
      ),
      body: const ProductsListScreen(),
    );
  }
}
