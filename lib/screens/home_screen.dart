import 'package:assignment/widgets/country_numbers.dart';
import 'package:provider/provider.dart';

import '../widgets/search_input.dart';
import 'package:flutter/material.dart';
import '../utils/home_screen_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedType = 'Landline and Mobile';
  List<String> dropdownItems = ['Web platform', 'Landline and Mobile'];
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    HomeScreenData homeScreenProvider = Provider.of<HomeScreenData>(context, listen: true);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        flexibleSpace: Padding(
          padding: const EdgeInsets.all(8),
          child: AppBar(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://d5xydlzdo08s0.cloudfront.net/media/celebrities/16647/magnusbiofinal__L.jpg'),
            ),
            actions: [
              IconButton(
                color: Theme.of(context).focusColor,
                onPressed: () {},
                icon: const Icon(Icons.equalizer_rounded),
              ),
              IconButton(
                color: Theme.of(context).focusColor,
                onPressed: () {},
                icon: const Icon(Icons.mail_outline),
              ),
              IconButton(
                color: Theme.of(context).focusColor,
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined),
              ),
            ],
            elevation: 0,
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset:
                      const Offset(0, 3), // defines the position of the shadow
                ),
              ], borderRadius: BorderRadius.circular(30), color: Colors.white),
              padding: EdgeInsets.all(size.width * 0.08),
              child: Column(
                children: [
                  const SearchInput(),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    children: homeScreenProvider.messageTypes.map((String type) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 20,
                          ),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 70, 65, 149),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Text(
                            type,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: DropdownButtonFormField<String>(
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        value: _selectedType,
                        style: const TextStyle(),
                        items: dropdownItems.map(
                          (String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16)),
                            );
                          },
                        ).toList(),
                        onChanged: (dynamic value) {
                          setState(() {
                            _selectedType = value;
                          });
                        }),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      _isExpanded = !_isExpanded;
                    }),
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(255, 74, 73, 73),
                              ),
                            ),
                            child: _isExpanded
                                ? const Icon(Icons.expand_more)
                                : const Icon(Icons.expand_less)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                          child: Text(
                            'Show numbers without verification',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: _isExpanded ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: const CountryNumbers(),
            )
          ],
        ),
      ),
    );
  }
}
