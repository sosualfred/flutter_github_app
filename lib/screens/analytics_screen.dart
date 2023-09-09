import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  static const routeName = '/analytics';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Analytics'),
      ),
      body: const Center(
        child: Text('Analytics Screen'),
      ),
    );
  }
}
