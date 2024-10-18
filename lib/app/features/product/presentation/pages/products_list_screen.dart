import 'package:dilettatest/app/features/product/presentation/bloc/product_bloc.dart';
import 'package:dilettatest/app/core/components/molecules/product_list_item.dart';
import 'package:dilettatest/app/features/wishlist/presentation/bloc/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        final products = state.products;
        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            return BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
              return ProductListItem(
                isWished: state.wishProducts
                    .where((wish) => wish.product.id == product.id)
                    .isNotEmpty,
                product: product,
                onToggleItem: () {
                  context.read<WishlistBloc>().toggleProductEvent(product);
                },
              );
            });
          },
        );
      },
    );
  }
}
