import 'package:dilettatest/app/core/app_root.dart';
import 'package:dilettatest/app/core/constants/font.dart';
import 'package:dilettatest/app/core/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'CompreFácil App',
        theme: ThemeData(
          fontFamily: fontFamily,
          primaryColor: Colors.blue.shade800,
        ),
        home: const AppRoot());
  }
}
