part of 'product_bloc.dart';

class ProductState extends Equatable {
  final List<ProductModel> products;

  const ProductState({
    this.products = const [],
  });

  ProductState copyWith({
    List<ProductModel>? products,
  }) {
    return ProductState(
      products: products ?? this.products,
    );
  }

  @override
  List<Object> get props => [
        products,
      ];
}
