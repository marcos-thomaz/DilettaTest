import 'package:dilettatest/app/features/products/presentation/pages/products_list_screen.dart';
import 'package:dilettatest/app/features/wishlist/presentation/bloc/wishlist_cubit.dart';
import 'package:dilettatest/app/features/wishlist/presentation/pages/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const WishlistScreen(),
              ));
            },
            child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                    return Badge.count(
                      textStyle: const TextStyle(fontSize: 13),
                      isLabelVisible: state.countWishes > 0,
                      count: state.countWishes,
                      child: const Icon(
                        Icons.favorite,
                        size: 24,
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
      body: const ProductsListScreen(),
    );
  }
}
