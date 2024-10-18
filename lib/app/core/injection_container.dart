import 'package:dilettatest/app/features/product/dependency_injection.dart';
import 'package:dilettatest/app/features/wishlist/dependency_injection.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initInjection() {
  _startGetItModules();
}

void _startGetItModules() {
  startProductFeature();
  startWishlistFeature();
}
