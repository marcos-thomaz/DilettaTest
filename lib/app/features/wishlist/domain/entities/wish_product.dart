import 'package:dilettatest/app/features/products/data/models/product_model.dart';
import 'package:equatable/equatable.dart';

class WishProduct extends Equatable {
  final ProductModel product;

  const WishProduct({
    required this.product,
  });

  @override
  List<Object?> get props => [product];
}