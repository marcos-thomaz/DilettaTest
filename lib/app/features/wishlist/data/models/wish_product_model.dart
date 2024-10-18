import 'package:dilettatest/app/features/wishlist/domain/entities/wish_product.dart';

class WishProductModel extends WishProduct {
  const WishProductModel({
    required super.product,
  });

  factory WishProductModel.fromJson(Map<String, dynamic> json) {
    return WishProductModel(
      product: json['product'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product,
    };
  }
}
