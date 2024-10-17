import 'package:dilettatest/app/features/product_list/presentation/pages/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('🏷️ CompreFácil App'),
      ),
      body: const Center(
        child: ProductListScreen(),
      ),
    );
  }
}
