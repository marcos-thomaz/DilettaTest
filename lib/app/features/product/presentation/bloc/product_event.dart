part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();
}

final class GetAllProductEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}

final class FavoriteProductEvent extends ProductEvent {
  final Product product;

  const FavoriteProductEvent({required this.product});

  @override
  List<Object?> get props => [];
}
