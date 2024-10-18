import 'package:dartz/dartz.dart';
import 'package:dilettatest/app/core/exceptions/app_exception.dart';
import 'package:dilettatest/app/features/wishlist/data/models/wish_product_model.dart';

abstract class WishlistRepository {
  Future<Either<AppException, void>> toggleProductWishlist(WishProductModel product);
  Future<Either<AppException, List<WishProductModel>>> getWishlist();
}
