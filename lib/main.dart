import 'package:dilettatest/app/core/app_root.dart';
import 'package:dilettatest/app/core/constants/font.dart';
import 'package:dilettatest/app/core/injection_container.dart';
import 'package:dilettatest/app/features/product/presentation/bloc/product_bloc.dart';
import 'package:dilettatest/app/features/wishlist/presentation/bloc/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CompreFácil App',
        theme: ThemeData(
          fontFamily: fontFamily,
          primaryColor: Colors.blue.shade800,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<ProductBloc>(
              lazy: false,
              create: (context) =>
                  getIt<ProductBloc>()..add(GetAllProductEvent()),
            ),
            BlocProvider<WishlistBloc>(
              lazy: false,
              create: (context) => getIt<WishlistBloc>()..getWishlistEvent(),
            ),
          ],
          child: const AppRoot(),
        ));
  }
}
