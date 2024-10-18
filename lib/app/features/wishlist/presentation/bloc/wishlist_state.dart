part of 'wishlist_bloc.dart';

class WishlistState extends Equatable {
  final List<ProductModel> products;

  const WishlistState({
    this.products = const [],
  });

  WishlistState copyWith({
    List<ProductModel>? products,
  }) {
    return WishlistState(
      products: products ?? this.products,
    );
  }

  @override
  List<Object> get props => [
        products,
      ];
}
