import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String status;
  final bool isAvailable;
  final void Function() onTap;

  const CustomCard({
    super.key,
    required this.name,
    required this.status,
    required this.isAvailable,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: isAvailable ? Colors.green[400] : Colors.red[400],
        child: Center(
          child: ListTile(
              title: Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              subtitle: Text(
                status,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 15.0,
                ),
              )),
        ),
      ),
    );
  }
}
