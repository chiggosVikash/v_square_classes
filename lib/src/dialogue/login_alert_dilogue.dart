import 'package:flutter/material.dart';

class LoginAlertDialogue extends StatelessWidget {
  const LoginAlertDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Login Required"),
      content: const Text("You need to login to use this feature"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        TextButton(
            onPressed: () {
              // Navigator.pushNamedAndRemoveUntil(
              //     context, Login.routeAddress, (route) => false);
            },
            child: const Text("Login")),
      ],
    );
  }
}
