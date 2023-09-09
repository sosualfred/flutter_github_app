import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/colors.dart';
import 'package:flutter_github_app/widgets/common/chip_widget.dart';

class RepoCard extends StatelessWidget {
  const RepoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
            // Name, Stars Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Kotlin DSL',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: grey800,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: secondaryColor,
                      size: 17,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      '4',
                      style: TextStyle(
                        fontSize: 14,
                        color: secondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            // Role, Company Row
            Text(
              'Smart like Sheldon cooper? Join in',
              style: TextStyle(
                fontSize: 14,
                color: grey500,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            // Tags Row
            Chips(
              color: primaryColor,
              labels: ['javascript', 'html', 'css', 'php', 'java'],
            ),
            SizedBox(
              height: 6,
            ),
            // Location Row
            Text(
              'Updated 10/08/2022',
              style: TextStyle(
                fontSize: 12,
                color: grey500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
