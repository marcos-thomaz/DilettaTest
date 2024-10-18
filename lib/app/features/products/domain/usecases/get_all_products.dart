import 'package:dartz/dartz.dart';
import 'package:dilettatest/app/core/exceptions/app_exception.dart';
import 'package:dilettatest/app/core/usecases/usecase.dart';
import 'package:dilettatest/app/features/products/data/models/product_model.dart';
import 'package:dilettatest/app/features/products/domain/repositories/product_repository.dart';

class GetAllProducts implements UseCase<List<ProductModel>, NoParams> {
  final ProductRepository productRepository;

  GetAllProducts({required this.productRepository});

  @override
  Future<Either<AppException, List<ProductModel>>> call(NoParams params) async {
    return await productRepository.getAllProducts();
  }
}
