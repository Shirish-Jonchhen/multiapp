import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:multiapp/core/router/app_router.gr.dart';

@RoutePage()
class Tab3Screen extends StatelessWidget {
  const Tab3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tab 3 Screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.looks_3, size: 80, color: Colors.orange),
            const SizedBox(height: 16),
            const Text(
              'Tab 3 — Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('A third tab with its own navigation stack.'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.router.push(const Tab3DetailRoute()),
              child: const Text('Push Detail Screen →'),
            ),
          ],
        ),
      ),
    );
  }
}
