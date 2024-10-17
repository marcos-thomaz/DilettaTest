import 'package:dilettatest/app/features/product_list/dependency_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initInjection() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  _startGetItModules();
}

void _startGetItModules() {
  startParkingLotFeature();
}
