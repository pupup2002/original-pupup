import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserName extends StatelessWidget{
  const UserName({super.key});

  @override
  Widget build( context) {
    return Container(
      child: const Column(
        children: [
          Text('ENTER YOUR AND YOUR DOG NAME'),
          TextField(


          ),
        ],
      ),
    );
  }

}