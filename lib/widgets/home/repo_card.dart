import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/colors.dart';
import 'package:flutter_github_app/constants/keys.dart';
import 'package:flutter_github_app/screens/repo_details_screen.dart';
import 'package:flutter_github_app/utils/formatters.dart';
import 'package:flutter_github_app/widgets/common/chips.dart';

class RepoCard extends StatelessWidget {
  const RepoCard({
    super.key,
    required this.repo,
  });

  final Map repo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        innerAppNavKey.currentState!.push(
          MaterialPageRoute(
            builder: (_) => RepoDetailsScreen(
              repo: repo,
            ),
          ),
        );
      },
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name, Stars Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        repo['name'] ?? '---',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: grey800,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: secondaryColor,
                        size: 17,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        formatNumberToCompact(repo['stargazerCount'] ?? 0),
                        style: const TextStyle(
                          fontSize: 14,
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              // Role, Company Row
              Text(
                repo['description'] ?? '---',
                style: const TextStyle(
                  fontSize: 12,
                  color: grey500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 8,
              ),
              // Tags Row
              Chips(
                color: primaryColor,
                labels: generateLangStrings(
                  langs: repo['languages']?['edges'] ?? [],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              // Location Row
              Text(
                'Updated ${formatDate(repo['updatedAt'])}',
                style: const TextStyle(
                  fontSize: 12,
                  color: grey500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
