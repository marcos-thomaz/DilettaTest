import 'package:dartz/dartz.dart';
import 'package:dilettatest/app/core/exceptions/app_exception.dart';
import 'package:dilettatest/app/features/product/data/models/product_model.dart';
import 'package:dio/dio.dart';

abstract class ProductRemoteDataSource {
  Future<Either<AppException, List<ProductModel>>> getAllProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<Either<AppException, List<ProductModel>>> getAllProducts() async {
    try {
      final result = await dio.get('https://fakestoreapi.com/products');

      final products = result.data
          .map<ProductModel>((e) => ProductModel.fromJson(e))
          .toList();
      return Right(products);
    } catch (e) {
      return Left(AppException('Failed to request at /v1/products - [$e]'));
    }
  }
}
