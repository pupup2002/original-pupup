import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserName extends StatelessWidget{
  const UserName({super.key});

  @override
  Widget build( context) {
    return Scaffold(
      body: Container(
        child:Column(
          children: [
            const Text('ENTER YOUR AND YOUR DOG NAME'),
            const SizedBox(height: 40,),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your username',
              ),
            ),
          ],
        ),
      ),

    );
  }

}