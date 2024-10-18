part of 'wishlist_cubit.dart';

class WishlistState extends Equatable {
  final List<WishProductModel> wishProducts;
  final bool hasError;

  const WishlistState({
    this.wishProducts = const [],
    this.hasError = false,
  });

  WishlistState copyWith({
    List<WishProductModel>? wishProducts,
    bool? hasError
  }) {
    return WishlistState(
      wishProducts: wishProducts ?? this.wishProducts,
      hasError: hasError ?? this.hasError,
    );
  }

  @override
  List<Object> get props => [
        wishProducts,
        hasError
      ];
}
