import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:multiapp/core/router/app_router.gr.dart';

@RoutePage()
class Tab1Screen extends StatelessWidget {
  const Tab1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tab 1 Screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.looks_one, size: 80, color: Colors.blue),
            const SizedBox(height: 16),
            const Text(
              'Tab 1 — Home',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('This demonstrates nested navigation within a tab.'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.router.push(const Tab1DetailRoute()),
              child: const Text('Push Detail Screen →'),
            ),
          ],
        ),
      ),
    );
  }
}
