import 'package:bloc/bloc.dart';
import 'package:dilettatest/app/core/usecases/usecase.dart';
import 'package:dilettatest/app/features/product/data/models/product_model.dart';
import 'package:dilettatest/app/features/product/domain/entities/product.dart';
import 'package:dilettatest/app/features/product/domain/usecases/get_all_products.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProducts getAllProducts;

  ProductBloc({
    required this.getAllProducts,
  }) : super(const ProductState()) {
    on<GetAllProductEvent>(_getAllProductEvent);
    on<FavoriteProductEvent>(_favoriteProductEvent);
  }

  Future<void> _getAllProductEvent(
      GetAllProductEvent event, Emitter emit) async {
    emit(state.copyWith(products: []));

    final products = await getAllProducts(NoParams());

    products.fold(
      (left) => emit(state.copyWith(products: [])),
      (right) => emit(state.copyWith(products: right)),
    );
  }

  Future<void> _favoriteProductEvent(
      FavoriteProductEvent event, Emitter emit) async {
    print('_favoriteProductEvent');
  }
}
