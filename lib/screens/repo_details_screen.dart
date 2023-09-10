import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/colors.dart';
import 'package:flutter_github_app/utils/formatters.dart';
import 'package:flutter_github_app/widgets/common/app_back_button.dart';
import 'package:flutter_github_app/widgets/common/chips.dart';
import 'package:flutter_github_app/widgets/common/label.dart';
import 'package:flutter_github_app/widgets/common/read_more.dart';
import 'package:flutter_github_app/widgets/common/repo_langs_progress_bar.dart';

class RepoDetailsScreen extends StatelessWidget {
  const RepoDetailsScreen({
    super.key,
    required this.repo,
  });

  final Map repo;

  static const routeName = '/repo-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        actions: [
          Row(
            children: [
              const Icon(
                Icons.star_rounded,
                color: secondaryColor,
                size: 26,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                formatNumberToCompact(repo['stargazerCount'] ?? 0),
                style: const TextStyle(
                  fontSize: 16,
                  color: secondaryColor,
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  repo['name'] ?? '---',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: grey800,
                  ),
                ),
                Label(
                  label: repo['visibility'] != null
                      ? capitalize(repo['visibility'])
                      : '---',
                  color: primaryColor,
                  fontSize: 14,
                ),
              ],
            ),
            const SizedBox(height: 20),
            DefaultTabController(
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
                            text: ' About ',
                            height: 32,
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
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Description',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: grey500,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ReadMoreTextWidget(
                                  text: repo['description'] ?? '---',
                                  maxLines: 10,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: grey700,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Chips(
                                  color: primaryColor,
                                  labels: generateLangStrings(
                                    langs: repo['languages']?['edges'] ?? [],
                                    limit: 30,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                const Text(
                                  'Releases',
                                  style: TextStyle(
                                    color: grey500,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  repo['latestRelease']?['tagName'] ?? '---',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: grey700,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  formatDateToLong(
                                    repo['latestRelease']?['createdAt'],
                                  ),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: grey500,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                const Text(
                                  'Languages',
                                  style: TextStyle(
                                    color: grey500,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Visibility(
                                  visible:
                                      repo['languages']?['edges'].isNotEmpty ??
                                          false,
                                  child: RepoLangsProgressBar(
                                    languages: [
                                      ...generateRepoLangs(
                                        langs:
                                            repo['languages']?['edges'] ?? [],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
