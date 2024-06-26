import 'package:flutter/material.dart';

class PupStartScreen extends StatelessWidget {
  const PupStartScreen(this.signUp, {super.key});

  final void Function(String accept) signUp;
  @override
  Widget build(context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Lets Get Started'),
            const SizedBox(
              height: 20,
            ),
            IconButton(
              onPressed: () {
                signUp('signUpPage');
              },
              icon: const Icon(Icons.keyboard_arrow_right),
            ),
          ]),
    );
  }
}
