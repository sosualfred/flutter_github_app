import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/colors.dart';
import 'package:flutter_github_app/utils/formatters.dart';
import 'package:flutter_github_app/widgets/common/app_back_button.dart';
import 'package:flutter_github_app/widgets/home/repo_card.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({
    super.key,
    required this.user,
  });

  final Map user;

  static const routeName = '/user-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            const SizedBox(height: 4),
            Container(
              height: 110,
              width: double.infinity,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  user['avatarUrl'] ??
                      'https://avatars.githubusercontent.com/u/583231?v=4',
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              user['name'] ?? '---',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: grey800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${(user['bio'].toString().isNotEmpty && user['bio'] != null) ? user['bio'] : '---'}',
              style: const TextStyle(
                fontSize: 14,
                color: grey500,
              ),
            ),
            const SizedBox(height: 16),
            // Following Row
            Row(
              children: [
                const Icon(
                  Iconsax.profile_2user,
                  size: 21,
                  color: grey500,
                ),
                const SizedBox(width: 4),
                Text(
                  '${formatNumberToCompact(user['followers']?['totalCount'] ?? 0)} followers',
                  style: const TextStyle(
                    fontSize: 14,
                    color: grey500,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(
                  Icons.circle,
                  size: 5,
                  color: grey500,
                ),
                const SizedBox(width: 6),
                Text(
                  '${formatNumberToCompact(user['following']?['totalCount'] ?? 0)} following',
                  style: const TextStyle(
                    fontSize: 14,
                    color: grey500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Location Row
            Row(
              children: [
                const Icon(
                  Iconsax.location,
                  size: 21,
                  color: grey500,
                ),
                const SizedBox(width: 4),
                Text(
                  user['location'] ?? 'Not available',
                  style: const TextStyle(
                    fontSize: 14,
                    color: grey500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Repositories Section
            Visibility(
              visible: user['repositories']?['edges']?.length != 0,
              child: DefaultTabController(
                length: 1,
                child: Expanded(
                  child: Column(
                    children: [
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
                              text: ' Repositories ',
                              height: 32,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            ListView.builder(
                              itemCount: user['repositories']?['edges']?.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return RepoCard(
                                  repo: user['repositories']?['edges']?[index]
                                      ?['node'],
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
            ),
          ],
        ),
      ),
    );
  }
}
