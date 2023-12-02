import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Welcome!',
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 10, 10, 10),
          ),
        ),
      ),
    );
  }
}
