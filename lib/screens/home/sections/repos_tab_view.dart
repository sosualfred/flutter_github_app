import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/colors.dart';
import 'package:flutter_github_app/widgets/common/app_placeholder.dart';
import 'package:flutter_github_app/widgets/home/repo_card.dart';
import 'package:ms_undraw/ms_undraw.dart';

class ReposTabView extends StatelessWidget {
  const ReposTabView({super.key});

  @override
  Widget build(BuildContext context) {
    const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          AppPlaceholder(
            title: Text(
              'What are you looking for?',
              style: TextStyle(
                fontSize: 14,
                color: grey500,
              ),
            ),
            illustration: UnDrawIllustration.searching,
          ),
        ],
      ),
    );
    const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          AppPlaceholder(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Cannot find any search result for ',
                  style: TextStyle(
                    fontSize: 14,
                    color: grey500,
                  ),
                ),
                Text(
                  'abc',
                  style: TextStyle(
                    fontSize: 14,
                    color: grey800,
                  ),
                ),
              ],
            ),
            illustration: UnDrawIllustration.no_data,
          ),
        ],
      ),
    );

    return Column(
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
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const RepoCard();
            },
          ),
        ),
      ],
    );
  }
}
