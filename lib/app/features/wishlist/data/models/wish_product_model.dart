import 'package:dilettatest/app/features/products/data/models/product_model.dart';
import 'package:dilettatest/app/features/wishlist/domain/entities/wish_product.dart';

class WishProductModel extends WishProduct {
  const WishProductModel({
    required super.product,
  });

  factory WishProductModel.fromJson(Map<String, dynamic> json) {
    return WishProductModel(
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
    };
  }
}
