import 'package:dartz/dartz.dart';
import 'package:dilettatest/app/core/exceptions/app_exception.dart';
import 'package:dilettatest/app/core/usecases/usecase.dart';
import 'package:dilettatest/app/features/product/data/models/product_model.dart';
import 'package:dilettatest/app/features/wishlist/domain/repositories/wishlist_repository.dart';

class GetWishlist implements UseCase<List<ProductModel>, NoParams> {
  final WishlistRepository wishlistRepository;

  GetWishlist({required this.wishlistRepository});

  @override
  Future<Either<AppException, List<ProductModel>>> call(NoParams params) async {
    return await wishlistRepository.getWishlist();
  }
}
