import 'package:dilettatest/app/features/wishlist/domain/entities/wish_product.dart';

class WishProductModel extends WishProduct {
  const WishProductModel({
    required super.id,
    required super.product,
  });

  factory WishProductModel.fromJson(Map<String, dynamic> json) {
    return WishProductModel(
      id: json['id'],
      product: json['product'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product,
    };
  }
}
