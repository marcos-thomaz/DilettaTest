import 'package:dilettatest/app/features/product/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

class WishProduct extends Equatable {
  final int id;
  final Product product;

  const WishProduct({
    required this.id,
    required this.product,
  });

  @override
  List<Object?> get props => [id, product];
}