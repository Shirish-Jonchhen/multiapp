import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Tab2DetailScreen extends StatelessWidget {
  const Tab2DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tab 2 Detail')),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.info_outline, size: 80, color: Colors.green),
            SizedBox(height: 16),
            Text(
              'Tab 2 Detail',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'The Nav bar is still intact',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
