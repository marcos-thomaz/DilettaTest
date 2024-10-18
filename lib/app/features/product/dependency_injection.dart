import 'package:dilettatest/app/core/constants/env.dart';
import 'package:dilettatest/app/core/injection_container.dart';
import 'package:dilettatest/app/features/product/data/datasources/product_data_source.dart';
import 'package:dilettatest/app/features/product/data/repositories/product_repository_impl.dart';
import 'package:dilettatest/app/features/product/domain/repositories/product_repository.dart';
import 'package:dilettatest/app/features/product/domain/usecases/get_all_products.dart';
import 'package:dilettatest/app/features/product/presentation/bloc/product_bloc.dart';
import 'package:dio/dio.dart';

void startProductFeature() {
  _networkModules();
  _datasourceModules();
  _repositoryModules();
  _usercasesModules();
  _blocModules();
}

void _networkModules() {
  getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(
        baseUrl: Env.baseUrl,
        receiveDataWhenStatusError: true,
        responseType: ResponseType.json,
      )));
}

void _datasourceModules() {
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(
      dio: getIt(),
    ),
  );
}

void _repositoryModules() {
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      productRemoteDataSource: getIt(),
    ),
  );
}

void _usercasesModules() {
  getIt.registerLazySingleton(() => GetAllProducts(
        productRepository: getIt(),
      ));
}

void _blocModules() {
  getIt.registerSingleton<ProductBloc>(
    ProductBloc(
      getAllProducts: getIt(),
    ),
  );
}
