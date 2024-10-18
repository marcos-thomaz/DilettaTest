import 'package:dartz/dartz.dart';
import 'package:dilettatest/app/core/exceptions/app_exception.dart';
import 'package:dilettatest/app/features/products/data/models/product_model.dart';

abstract class ProductRepository {
  Future<Either<AppException, List<ProductModel>>> getAllProducts();
}
