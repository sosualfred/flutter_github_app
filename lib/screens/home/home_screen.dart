import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/colors.dart';
import 'package:flutter_github_app/providers/search_provider.dart';
import 'package:flutter_github_app/screens/home/sections/repos_tab_view.dart';
import 'package:flutter_github_app/screens/home/sections/users_tab_view.dart';
import 'package:flutter_github_app/utils/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Notification'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
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
              Consumer(
                builder: (context, ref, child) {
                  return TextField(
                    textInputAction: TextInputAction.search,
                    onChanged: (searchTerm) {
                      Debounce.debounce(() {
                        ref
                            .read(searchTermProvider.notifier)
                            .setSearchTerm(searchTerm);
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Iconsax.search_normal_1,
                        color: secondaryColor,
                        size: 26,
                      ),
                    ),
                  );
                },
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
                      height: 32,
                    ),
                    Tab(
                      text: 'Repositories',
                      height: 32,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    UsersTabView(),
                    ReposTabView(),
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
