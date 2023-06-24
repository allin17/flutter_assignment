import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> messageTypes = ['SMS', 'MMS', 'Voice'];
  String _selectedType = 'Landline and Mobile';
  List<String> dropdownItems = ['Web platform', 'Landline and Mobile'];
  bool _isExpanded = true;

  Map<String, String> countryFlags = {
    'United states':
        'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/2560px-Flag_of_the_United_States.svg.png',
    'United Kingdom':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Flag_of_Great_Britain_%281707%E2%80%931800%29.svg/2560px-Flag_of_Great_Britain_%281707%E2%80%931800%29.svg.png'
  };
  Map<String, List<String>> countries = {
    'United states': [
      '+1(201)123-45-67',
      '+1(201)123-45-67',
      '+1(201)123-45-67'
    ],
    'United Kingdom': [
      '+44(201)123-45-67',
      '+44(201)123-45-67',
      '+44(201)123-45-67'
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 245, 210, 222),
        flexibleSpace: Padding(
          padding: EdgeInsets.all(8),
          child: AppBar(
            leading: const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://w7.pngwing.com/pngs/485/867/png-transparent-avatar-of-a-chinese-man.png'),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.equalizer_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.mail_outline),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined),
              ),
            ],
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 245, 210, 222),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            Offset(0, 3), // defines the position of the shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Country name',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                        children: messageTypes.map((String type) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
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
                    }).toList()),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 2),
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
                                color: Color.fromARGB(255, 74, 73, 73),
                              ),
                            ),
                            child: _isExpanded
                                ? const Icon(Icons.expand_less)
                                : const Icon(Icons.expand_more),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text('Show numbers without verification')
                        ],
                      ),
                    )
                  ],
                )),
            AnimatedOpacity(
              opacity: _isExpanded ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: Column(
                  children: countries.keys.map((String country) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(countryFlags[country]!),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            country,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // defines the position of the shadow
                      ),
                    ],
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Column(
                          children: countries[country]!.map((String item) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
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
                                    radius: 15,
                                    backgroundColor: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.blue,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList()),
                    )
                  ],
                );
              }).toList()),
            )
          ],
        ),
      ),
    );
  }
}
