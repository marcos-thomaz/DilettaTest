part of 'product_bloc.dart';

class ProductState extends Equatable {
  final List<ProductModel> products;
  final bool isLoading;


  const ProductState({
    this.products = const [],
    this.isLoading = false,
  });

  ProductState copyWith({
    List<ProductModel>? products,
    bool? isLoading,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        products,
        isLoading,
      ];
}
