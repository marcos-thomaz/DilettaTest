part of 'wishlist_cubit.dart';

class WishlistState extends Equatable {
  final List<WishProductModel> wishProducts;
  final int countWishes;
  final bool hasError;

  const WishlistState({
    this.wishProducts = const [],
    this.countWishes = 0,
    this.hasError = false,
  });

  WishlistState copyWith({
    List<WishProductModel>? wishProducts,
    int? countWishes,
    bool? hasError
  }) {
    return WishlistState(
      wishProducts: wishProducts ?? this.wishProducts,
      countWishes: countWishes ?? this.countWishes,
      hasError: hasError ?? this.hasError,
    );
  }

  @override
  List<Object> get props => [
        wishProducts,
        countWishes,
        hasError
      ];
}
