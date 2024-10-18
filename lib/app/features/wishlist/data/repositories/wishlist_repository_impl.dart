import 'package:dartz/dartz.dart';
import 'package:dilettatest/app/core/exceptions/app_exception.dart';
import 'package:dilettatest/app/features/product/data/models/product_model.dart';
import 'package:dilettatest/app/features/wishlist/data/datasources/wishlist_data_source.dart';
import 'package:dilettatest/app/features/wishlist/domain/repositories/wishlist_repository.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistDataSource wishlistDataSource;

  WishlistRepositoryImpl({required this.wishlistDataSource});

  @override
  Future<Either<AppException, List<ProductModel>>> getWishlist() {
    return wishlistDataSource.getWishlist();
  }

  @override
  Future<Either<AppException, void>> toggleProductWishlist(ProductModel product) {
    return wishlistDataSource.toggleProductWishlist(product);
  }

}
