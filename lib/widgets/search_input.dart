import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:assignment/utils/home_screen_data.dart';

/// Search [TextField] with search icon
class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late TextEditingController _searchController;
  @override
  void initState() {
    final homeScreenProvider =
        Provider.of<HomeScreenData>(context, listen: false);

    super.initState();
    _searchController =
        TextEditingController(text: homeScreenProvider.searchValue);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenProvider =
        Provider.of<HomeScreenData>(context, listen: false);
    return Row(
      children: [
        const Icon(Icons.search),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: TextField(
            controller: _searchController,
            onChanged: homeScreenProvider.setSearchValue,
            decoration: const InputDecoration(
                hintText: 'Country name',
                hintStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
          ),
        ),
      ],
    );
  }
}
