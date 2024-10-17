extension DoubleExtension on double {
  String get toStringCurrency => 'R\$ ${toStringAsFixed(2).replaceAll('.', ',')}';
}