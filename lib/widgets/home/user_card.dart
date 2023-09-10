import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/colors.dart';
import 'package:flutter_github_app/constants/keys.dart';
import 'package:flutter_github_app/screens/user_details_screen.dart';
import 'package:flutter_github_app/utils/formatters.dart';
import 'package:flutter_github_app/widgets/common/chips.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final Map user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        innerAppNavKey.currentState!.push(
          MaterialPageRoute(
            builder: (_) => UserDetailsScreen(
              user: user,
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
              // Name, Avatar, Followers Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 11,
                        backgroundImage: NetworkImage(
                          user['avatarUrl'] ??
                              'https://avatars.githubusercontent.com/u/583231?v=4',
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        user['name'] ?? '---',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: grey800,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${formatNumberToCompact(user['followers']?['totalCount'] ?? 0)} followers',
                    style: const TextStyle(
                      fontSize: 14,
                      color: secondaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              // Role, Company Row
              Text(
                '${(user['bio'].toString().isNotEmpty && user['bio'] != null) ? user['bio'] : '---'}',
                style: const TextStyle(
                  fontSize: 14,
                  color: grey500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              // Tags Row
              Chips(
                color: appBlue,
                labels: generateUserLangsStrings(
                  repos: user['repositories']?['edges'] ?? [],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              // Location Row
              Row(
                children: [
                  const Icon(
                    Iconsax.location,
                    color: grey500,
                    size: 14,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    user['location'] ?? 'Not available',
                    style: const TextStyle(
                      fontSize: 12,
                      color: grey500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
