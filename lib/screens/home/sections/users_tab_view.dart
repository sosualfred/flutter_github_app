import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/colors.dart';
import 'package:flutter_github_app/widgets/home/user_card.dart';

class UsersTabView extends StatelessWidget {
  const UsersTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                'Showing',
                style: TextStyle(
                  fontSize: 16,
                  color: grey400,
                ),
              ),
              Text(
                ' 30 results',
                style: TextStyle(
                  fontSize: 16,
                  color: grey800,
                ),
              ),
              Text(
                ' for',
                style: TextStyle(
                  fontSize: 16,
                  color: grey400,
                ),
              ),
              Text(
                ' chr',
                style: TextStyle(
                  fontSize: 16,
                  color: grey800,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const UserCard();
            },
          ),
        ],
      ),
    );
  }
}
