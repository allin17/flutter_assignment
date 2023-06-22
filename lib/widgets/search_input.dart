import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.search),
        const TextField(
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            hintText: 'Country name',
            hintStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
            //prefixIcon: Icon(Icons.search),
          ),
        ),
      ],
    );
  }
}
