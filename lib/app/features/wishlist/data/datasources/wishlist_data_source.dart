import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dilettatest/app/core/exceptions/app_exception.dart';
import 'package:dilettatest/app/features/wishlist/data/models/wish_product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedWishlist = 'CACHED_WISHLIST';

abstract class WishlistDataSource {
  Future<Either<AppException, List<WishProductModel>>> getWishlist();
  Future<Either<AppException, List<WishProductModel>>> toggleProductWishlist(
      WishProductModel product);
}

class WishlistDataSourceImpl implements WishlistDataSource {
  final SharedPreferences sharedPreferences;

  WishlistDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Either<AppException, List<WishProductModel>>> getWishlist() {
    try {
      final strWishlist = sharedPreferences.getStringList(cachedWishlist);

      if (strWishlist == null) {
        return Future.value(right([]));
      }

      List<WishProductModel> wishlist = strWishlist
          .map(
            (strWishProductModel) =>
                WishProductModel.fromJson(json.decode(strWishProductModel)),
          )
          .toList();

      return Future.value(Right(wishlist));
    } catch (e) {
      throw Left(e);
    }
  }

  @override
  Future<Either<AppException, List<WishProductModel>>> toggleProductWishlist(
      WishProductModel product) async {
    try {
      List<String> strWishlist =
          sharedPreferences.getStringList(cachedWishlist) ?? [];
      List<WishProductModel> wishlist = strWishlist
          .map(
            (strWishProductModel) =>
                WishProductModel.fromJson(json.decode(strWishProductModel)),
          )
          .toList();

      final productAlreadyAdded =
          wishlist.indexWhere((item) => item.product.id == product.product.id);

      if (productAlreadyAdded != -1) {
        wishlist.removeAt(productAlreadyAdded);
      } else {
        wishlist.add(product);
      }

      await sharedPreferences.setStringList(cachedWishlist,
          wishlist.map((e) => json.encode(e.toJson())).toList());

      return Right(wishlist);
    } catch (e) {
      throw Left(e);
    }
  }
}
