import 'package:flutter/material.dart';

class SignUnPage extends StatefulWidget {
  const SignUnPage({super.key});

  @override
  State<SignUnPage> createState() => _SignUnPageState();
}

class _SignUnPageState extends State<SignUnPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Sign Un Page'),
      ),
    );
  }
}