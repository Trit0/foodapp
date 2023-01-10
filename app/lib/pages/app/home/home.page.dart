import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/routing/main.router.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Home page"),
          const SizedBox(height: 16),
          // ElevatedButton(
          //   child: const Text(
          //     "Sign out",
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   onPressed: () => context.replaceRoute(const AuthPageRoute()),
          // ),
          // ElevatedButton(
          //   child: const Text(
          //     "People list",
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   onPressed: () => context.replaceRoute(const PeopleListPageRoute()),
          // )
        ],
      ),
    );
  }
}
