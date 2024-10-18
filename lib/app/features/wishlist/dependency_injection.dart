import 'package:dilettatest/app/core/injection_container.dart';
import 'package:dilettatest/app/features/wishlist/data/datasources/wishlist_data_source.dart';
import 'package:dilettatest/app/features/wishlist/data/repositories/wishlist_repository_impl.dart';
import 'package:dilettatest/app/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:dilettatest/app/features/wishlist/domain/usecases/get_wishlist.dart';
import 'package:dilettatest/app/features/wishlist/domain/usecases/toggle_product.dart';
import 'package:dilettatest/app/features/wishlist/presentation/bloc/wishlist_cubit.dart';

void startWishlistFeature() {
  _datasourceModules();
  _repositoryModules();
  _usercasesModules();
  _blocModules();
}

void _datasourceModules() {
  getIt.registerLazySingleton<WishlistDataSource>(
    () => WishlistDataSourceImpl(
      sharedPreferences: getIt(),
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
