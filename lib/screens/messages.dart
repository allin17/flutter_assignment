import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  void initState() {
    super.initState();
  }

  double targetValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
          curve: Curves.elasticOut,
          tween: Tween(begin: 0, end: targetValue),
          duration: const Duration(seconds: 1),
          builder: (BuildContext context, double size, child) {
            return IconButton(
                iconSize: size,
                onPressed: () {
                  setState(() {
                    targetValue = targetValue == 50 ? 100 : 50;
                  });
                },
                icon: child!);
          },
          child: const Icon(Icons.aspect_ratio),
        ),
      ),
    );
  }
}
