import 'package:dilettatest/app/core/injection_container.dart';
import 'package:dilettatest/app/features/wishlist/data/datasources/wishlist_data_source.dart';
import 'package:dilettatest/app/features/wishlist/data/repositories/wishlist_repository_impl.dart';
import 'package:dilettatest/app/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:dilettatest/app/features/wishlist/domain/usecases/get_wishlist.dart';
import 'package:dilettatest/app/features/wishlist/domain/usecases/toggle_product.dart';
import 'package:dilettatest/app/features/wishlist/presentation/bloc/wishlist_cubit.dart';
import 'package:dio/dio.dart';

void startWishlistFeature() {
  // _networkModules();
  _datasourceModules();
  _repositoryModules();
  _usercasesModules();
  _blocModules();
}

void _networkModules() {
  getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(
        baseUrl: 'https://670e655e3e715186165457a2.mockapi.io/api',
        receiveDataWhenStatusError: true,
        responseType: ResponseType.json,
      )));
}

void _datasourceModules() {
  getIt.registerLazySingleton<WishlistDataSource>(
    () => WishlistDataSourceImpl(
      dio: getIt(),
    ),
  );
}

void _repositoryModules() {
  getIt.registerLazySingleton<WishlistRepository>(
    () => WishlistRepositoryImpl(
      wishlistDataSource: getIt(),
    ),
  );
}

void _usercasesModules() {
  getIt.registerLazySingleton(() => GetWishlist(
        wishlistRepository: getIt(),
      ));
  getIt.registerLazySingleton(() => ToggleProduct(
        wishlistRepository: getIt(),
      ));
}

void _blocModules() {
  getIt.registerSingleton<WishlistBloc>(
    WishlistBloc(
      getWishlist: getIt(),
      toggleProduct: getIt(),
    ),
  );
}
