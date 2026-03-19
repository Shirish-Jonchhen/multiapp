import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:multiapp/core/router/app_router.gr.dart';

@RoutePage()
class Tab2Screen extends StatelessWidget {
  const Tab2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tab 2 Screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.looks_two, size: 80, color: Colors.green),
            const SizedBox(height: 16),
            const Text(
              'Tab 2 — Explore',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Another tab with its own navigation stack.'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.router.push(const Tab2DetailRoute()),
              child: const Text('Push Detail Screen →'),
            ),
          ],
        ),
      ),
    );
  }
}
