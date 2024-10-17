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
      ),
      body: const Center(
        child: ProductsListScreen(),
      ),
    );
  }
}
