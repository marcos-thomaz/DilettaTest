import 'package:dilettatest/app/core/app_root.dart';
import 'package:dilettatest/app/core/constants/font.dart';
import 'package:dilettatest/app/core/injection_container.dart';
import 'package:dilettatest/app/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
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
          ],
          child: const AppRoot(),
        ));
  }
}
