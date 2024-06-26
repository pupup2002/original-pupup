import 'package:flutter/material.dart';

import 'SignUp_Buttons.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage(this.phoneNumber, {super.key});
  final void Function(String accept) phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: const BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage('assets/pexels-kateryna-babaieva-1423213-3715586.jpg'),
          fit: BoxFit.cover,

          colorFilter: ColorFilter.mode(
            Color.fromARGB(77, 0, 0, 0),
            BlendMode.darken,
          ),
        ),
      ),

      child: SignUpButtons(phoneNumber),
    );
  }
}
