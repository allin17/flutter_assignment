import 'package:flutter/material.dart';

/// Widget for displaying 1 call
class CallItem extends StatelessWidget {
  const CallItem({super.key, required this.item});
  final String item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            const Icon(
              Icons.phone_iphone_outlined,
              size: 28,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const Text('New Jersey'),
              ],
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        const Row(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.blue,
            ),
            SizedBox(
              width: 5,
            ),
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }
}
