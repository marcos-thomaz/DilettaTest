import 'package:dartz/dartz.dart';
import 'package:dilettatest/app/core/exceptions/app_exception.dart';
import 'package:dilettatest/app/features/products/data/datasources/product_data_source.dart';
import 'package:dilettatest/app/features/products/data/models/product_model.dart';
import 'package:dilettatest/app/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<Either<AppException, List<ProductModel>>> getAllProducts() {
    return productRemoteDataSource.getAllProducts();
  }
}
