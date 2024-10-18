import 'package:dartz/dartz.dart';
import 'package:dilettatest/app/core/exceptions/app_exception.dart';
import 'package:dilettatest/app/core/usecases/usecase.dart';
import 'package:dilettatest/app/features/product/data/models/product_model.dart';
import 'package:dilettatest/app/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:equatable/equatable.dart';

class ToggleProduct implements UseCase<void, Params> {
  final WishlistRepository wishlistRepository;

  ToggleProduct({required this.wishlistRepository});

  @override
  Future<Either<AppException, void>> call(Params params) async {
    return await wishlistRepository.toggleProductWishlist(params.product);
  }
}

class Params extends Equatable {
  final ProductModel product;

  const Params({required this.product});

  @override
  List<Object> get props => [product];
}
