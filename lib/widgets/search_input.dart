import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.search),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Country name',
                hintStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
          ),
        ),
      ],
    );
  }
}
