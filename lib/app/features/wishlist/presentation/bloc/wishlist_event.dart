part of 'wishlist_bloc.dart';

sealed class WishlistEvent extends Equatable {
  const WishlistEvent();
}

final class GetWishlistEvent extends WishlistEvent {
  @override
  List<Object> get props => [];
}

final class ToggleProductEvent extends WishlistEvent {
  final Product product;

  const ToggleProductEvent({required this.product});

  @override
  List<Object> get props => [product];
}
