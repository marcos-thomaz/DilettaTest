import 'package:bloc/bloc.dart';
import 'package:dilettatest/app/core/usecases/usecase.dart';
import 'package:dilettatest/app/features/product/data/models/product_model.dart';
import 'package:dilettatest/app/features/wishlist/data/models/wish_product_model.dart';
import 'package:dilettatest/app/features/wishlist/domain/usecases/get_wishlist.dart';
import 'package:dilettatest/app/features/wishlist/domain/usecases/toggle_product.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_state.dart';

class WishlistBloc extends Cubit<WishlistState> {
  final GetWishlist getWishlist;
  final ToggleProduct toggleProduct;

  WishlistBloc({
    required this.getWishlist,
    required this.toggleProduct,
  }) : super(const WishlistState());

  void getWishlistEvent() async {
    final result = await getWishlist(NoParams());
    result.fold(
      (left) => emit(state.copyWith(hasError: true)),
      (right) => emit(state.copyWith(wishProducts: right, countWishes: right.length)),
    );
  }

  void toggleProductEvent(ProductModel product) async {
    final result = await toggleProduct(
        Params(product: WishProductModel(product: product)));
    result.fold(
      (left) => emit(state.copyWith(hasError: true)),
      (right) => emit(state.copyWith(wishProducts: right, countWishes: right.length)),
    );
  }
}
