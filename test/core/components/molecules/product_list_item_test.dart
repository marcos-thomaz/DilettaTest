import 'package:dilettatest/app/core/components/molecules/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dilettatest/app/features/products/domain/entities/product.dart';

import 'dart:io';

class TestHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  const product = Product(
    id: 1,
    title: 'Product 1',
    price: 29.99,
    description: 'Description 1',
    category: 'Category 1',
    image: 'https://example.com/image1.jpg',
  );

  setUpAll(() {
    // Substitui o comportamento padrão do HttpClient por uma implementação de teste
    HttpOverrides.global = TestHttpOverrides();
  });

  testWidgets('should display product details correctly',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ProductListItem(
            product: product,
            isWished: false,
          ),
        ),
      ),
    );

    // Act & Assert
    expect(find.text('Product 1'), findsOneWidget);
    expect(find.text('Category 1'), findsOneWidget);
    expect(find.text('R\$ 29,99'),
        findsOneWidget); // Ajuste o formato conforme necessário
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });

  testWidgets('should display favorite_border icon when isWished is false',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ProductListItem(
            product: product,
            isWished: false,
          ),
        ),
      ),
    );

    // Act & Assert
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsNothing);
  });

  testWidgets('should display favorite icon when isWished is true',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ProductListItem(
            product: product,
            isWished: true,
          ),
        ),
      ),
    );

    // Act & Assert
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsNothing);
  });

  testWidgets('should call onToggleItem when favorite icon is tapped',
      (WidgetTester tester) async {
    // Arrange
    var isToggled = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProductListItem(
            product: product,
            isWished: false,
            onToggleItem: () {
              isToggled = true;
            },
          ),
        ),
      ),
    );

    // Act
    await tester.tap(find.byIcon(Icons.favorite_border));
    await tester.pumpAndSettle();

    // Assert
    expect(isToggled, isTrue);
  });
}
