import 'package:bloc/bloc.dart';
import 'package:dilettatest/app/core/usecases/usecase.dart';
import 'package:dilettatest/app/features/products/data/models/product_model.dart';
import 'package:dilettatest/app/features/products/domain/usecases/get_all_products.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProducts getAllProducts;

  ProductBloc({
    required this.getAllProducts,
  }) : super(const ProductState()) {
    on<GetAllProductEvent>(_getAllProductEvent);
  }

  Future<void> _getAllProductEvent(
      GetAllProductEvent event, Emitter emit) async {
    emit(state.copyWith(products: [], isLoading: true));

    final products = await getAllProducts(NoParams());

    products.fold(
      (left) => emit(state.copyWith(products: [], isLoading: false)),
      (right) => emit(state.copyWith(products: right, isLoading: false)),
    );
  }
}
