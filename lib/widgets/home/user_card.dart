import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/colors.dart';
import 'package:flutter_github_app/constants/keys.dart';
import 'package:flutter_github_app/screens/user_details_screen.dart';
import 'package:flutter_github_app/widgets/common/chip_widget.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        innerAppNavKey.currentState!.pushNamed(UserDetailsScreen.routeName);
      },
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: const Padding(
          padding: EdgeInsets.all(10),
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
                        radius: 14,
                        backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/583231?v=4',
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Christopher Marcus',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: grey800,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '1.2k followers',
                    style: TextStyle(
                      fontSize: 16,
                      color: secondaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              // Role, Company Row
              Text(
                'Engineering lead at effectstudios',
                style: TextStyle(
                  fontSize: 14,
                  color: grey500,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              // Tags Row
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  AppChip(
                    label: 'flutter',
                    color: appBlue,
                  ),
                  AppChip(
                    label: 'frontend',
                    color: appBlue,
                  ),
                  AppChip(
                    label: 'dart',
                    color: appBlue,
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              // Location Row
              Row(
                children: [
                  Icon(
                    Iconsax.location,
                    color: grey500,
                    size: 14,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Berlin, Germany',
                    style: TextStyle(
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
