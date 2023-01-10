import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/routing/main.router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage();

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Sign in page"),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text(
              "Sign in",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => context.replaceRoute(const AppPageRoute()),
          ),
        ],
      ),
    );
  }
}
