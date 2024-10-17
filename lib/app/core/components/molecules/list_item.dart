import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final bool isClickable;

  const ListItem({
    super.key,
    required this.title,
    this.isClickable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: isClickable ? Colors.black : Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          if (isClickable) ...[
            const Icon(Icons.arrow_forward_ios),
          ]
        ],
      ),
    );
  }
}
