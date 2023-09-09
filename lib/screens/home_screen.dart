import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/colors.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(
              Iconsax.notification,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/analytics');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              // Search Field
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  fillColor: whiteColor,
                  filled: true,
                  prefixIcon: Icon(
                    Iconsax.search_normal_1,
                    color: secondaryColor,
                    size: 28,
                  ),
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(
                      color: grey200,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(
                      color: grey400,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              // Tab Bar
              const SizedBox(
                width: double.infinity,
                child: TabBar(
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabAlignment: TabAlignment.start,
                  labelPadding: EdgeInsets.only(right: 12),
                  tabs: [
                    Tab(
                      text: 'Users',
                    ),
                    Tab(
                      text: 'Repositories',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text('User $index'),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text('Repository $index'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
