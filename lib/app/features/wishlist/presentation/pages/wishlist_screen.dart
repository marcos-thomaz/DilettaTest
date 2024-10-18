import 'package:dilettatest/app/core/components/molecules/product_list_item.dart';
import 'package:dilettatest/app/core/injection_container.dart';
import 'package:dilettatest/app/features/wishlist/presentation/bloc/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wishlist'),
        ),
        body: BlocBuilder<WishlistBloc, WishlistState>(
          bloc: getIt<WishlistBloc>(),
          builder: (context, state) {
            final wishProducts = state.wishProducts;
            if (wishProducts.isEmpty) {
              return const Center(
                child: Text('Não há produtos na sua wishlist 🥹'),
              );
            }
            return ListView.builder(
              itemCount: wishProducts.length,
              itemBuilder: (context, index) {
                final product = wishProducts[index].product;
                return ProductListItem(
                  isWished: true,
                  product: product,
                );
              },
            );
          },
        ));
  }
}
