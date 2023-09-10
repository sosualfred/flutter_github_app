import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/colors.dart';
import 'package:flutter_github_app/providers/search_provider.dart';
import 'package:flutter_github_app/services/graphql/search_queries.dart';
import 'package:flutter_github_app/widgets/common/app_placeholder.dart';
import 'package:flutter_github_app/widgets/common/results_count.dart';
import 'package:flutter_github_app/widgets/home/repo_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ms_undraw/ms_undraw.dart';

class ReposTabView extends ConsumerWidget {
  const ReposTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTerm = ref.watch(searchTermProvider);

    const limit = 20;

    return Query(
      options: QueryOptions(
        document: gql(searchRepo),
        variables: {
          'searchTerm': searchTerm,
          'limit': limit,
        },
      ),
      builder: (
        QueryResult result, {
        VoidCallback? refetch,
        FetchMore? fetchMore,
      }) {
        if (result.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (result.hasException) {
          return Center(
            child: Text(result.exception.toString()),
          );
        }

        bool showPlaceholder = result.isNotLoading && searchTerm.isEmpty;
        if (showPlaceholder) {
          return const SingleChildScrollView(
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
        }

        if (result.data?['search']?['repositoryCount'] == 0) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                AppPlaceholder(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Cannot find any search result for ',
                        style: TextStyle(
                          fontSize: 14,
                          color: grey500,
                        ),
                      ),
                      Text(
                        searchTerm,
                        style: const TextStyle(
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
        }

        final repos = result.data?['search']?['edges'];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResultsCount(
              searchTerm: searchTerm,
              resultsCount: result.data?['search']?['repositoryCount'] ?? 0,
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: repos.length,
                itemBuilder: (context, index) {
                  return RepoCard(
                    repo: repos[index]?['node'],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
