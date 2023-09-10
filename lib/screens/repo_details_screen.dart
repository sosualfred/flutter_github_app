import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/colors.dart';
import 'package:flutter_github_app/widgets/common/app_back_button.dart';
import 'package:flutter_github_app/widgets/common/chips.dart';
import 'package:flutter_github_app/widgets/common/label.dart';

class RepoDetailsScreen extends StatelessWidget {
  const RepoDetailsScreen({super.key});

  static const routeName = '/repo-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        actions: const [
          Row(
            children: [
              Icon(
                Icons.star_rounded,
                color: secondaryColor,
                size: 26,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                '5',
                style: TextStyle(
                  fontSize: 16,
                  color: secondaryColor,
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kotlin DSL',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: grey800,
                  ),
                ),
                Label(
                  label: 'Public',
                  color: primaryColor,
                  fontSize: 16,
                ),
              ],
            ),
            SizedBox(height: 20),
            DefaultTabController(
              length: 1,
              child: Expanded(
                child: Column(
                  children: [
                    // Tab Bar
                    SizedBox(
                      width: double.infinity,
                      child: TabBar(
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabAlignment: TabAlignment.start,
                        labelPadding: EdgeInsets.only(right: 12),
                        tabs: [
                          Tab(
                            text: ' About ',
                            height: 32,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Description',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: grey500,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pretium odio metus, feugiat mattis metus consequat non. Suspendisse faucibus efficitur fringilla.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: grey700,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Chips(
                                  labels: [
                                    'javascript',
                                    'html',
                                    'css',
                                    'php',
                                  ],
                                  color: primaryColor,
                                ),
                                SizedBox(height: 24),
                                Text(
                                  'Releases',
                                  style: TextStyle(
                                    color: grey500,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  '1.1.10',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: grey700,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Dec 21, 2022',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: grey500,
                                  ),
                                ),
                                SizedBox(height: 24),
                                Text(
                                  'Languages',
                                  style: TextStyle(
                                    color: grey500,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 12),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
