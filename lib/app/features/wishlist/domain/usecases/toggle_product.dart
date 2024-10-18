import 'package:dartz/dartz.dart';
import 'package:dilettatest/app/core/exceptions/app_exception.dart';
import 'package:dilettatest/app/core/usecases/usecase.dart';
import 'package:dilettatest/app/features/wishlist/data/models/wish_product_model.dart';
import 'package:dilettatest/app/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:equatable/equatable.dart';

class ToggleProduct implements UseCase<List<WishProductModel>, Params> {
  final WishlistRepository wishlistRepository;

  ToggleProduct({required this.wishlistRepository});

  @override
  Future<Either<AppException, List<WishProductModel>>> call(Params params) async {
    return await wishlistRepository.toggleProductWishlist(params.product);
  }
}

class Params extends Equatable {
  final WishProductModel product;

  const Params({required this.product});

  @override
  List<Object> get props => [product];
}
