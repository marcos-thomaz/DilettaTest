import 'package:dartz/dartz.dart';
import 'package:dilettatest/app/core/exceptions/app_exception.dart';
import 'package:dilettatest/app/features/wishlist/data/models/wish_product_model.dart';
import 'package:dio/dio.dart';

abstract class WishlistDataSource {
  Future<Either<AppException, List<WishProductModel>>> getWishlist();
  Future<Either<AppException, void>> toggleProductWishlist(WishProductModel product);
}

class WishlistDataSourceImpl implements WishlistDataSource {
  final Dio dio;

  WishlistDataSourceImpl({required this.dio});
  
  @override
  Future<Either<AppException, List<WishProductModel>>> getWishlist() {
    // TODO: implement getWishlist
    throw UnimplementedError();
  }
  
  @override
  Future<Either<AppException, void>> toggleProductWishlist(WishProductModel product) {
    // TODO: implement toggleProductWishlist
    throw UnimplementedError();
  }
}
