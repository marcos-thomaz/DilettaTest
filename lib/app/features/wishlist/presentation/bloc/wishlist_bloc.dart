import 'package:bloc/bloc.dart';
import 'package:dilettatest/app/features/product/data/models/product_model.dart';
import 'package:dilettatest/app/features/product/domain/entities/product.dart';
import 'package:dilettatest/app/features/wishlist/domain/usecases/get_wishlist.dart';
import 'package:dilettatest/app/features/wishlist/domain/usecases/toggle_product.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';

part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final GetWishlist getWishlist;
  final ToggleProduct toggleProduct;

  WishlistBloc({
    required this.getWishlist,
    required this.toggleProduct,
  }) : super(const WishlistState()) {
    on<GetWishlistEvent>(_getWishlistEvent);
    on<ToggleProductEvent>(_toggleProductEvent);
  }

  Future<void> _getWishlistEvent(
      GetWishlistEvent event, Emitter emit) async {
    print('_getWishlistEvent');
  }

  Future<void> _toggleProductEvent(
      ToggleProductEvent event, Emitter emit) async {
    print('_toggleWishlistProductEvent');
  }
}
