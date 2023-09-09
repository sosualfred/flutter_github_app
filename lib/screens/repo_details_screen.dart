import 'package:flutter/material.dart';

class RepoDetailsScreen extends StatelessWidget {
  const RepoDetailsScreen({super.key});

  static const routeName = '/repo-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repo Details'),
      ),
      body: const Center(
        child: Text('Repo Details Screen'),
      ),
    );
  }
}
