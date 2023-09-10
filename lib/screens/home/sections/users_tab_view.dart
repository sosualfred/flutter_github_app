import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/colors.dart';
import 'package:flutter_github_app/providers/search_provider.dart';
import 'package:flutter_github_app/services/graphql/search_queries.dart';
import 'package:flutter_github_app/widgets/common/app_placeholder.dart';
import 'package:flutter_github_app/widgets/common/results_count.dart';
import 'package:flutter_github_app/widgets/home/user_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ms_undraw/ms_undraw.dart';

class UsersTabView extends ConsumerWidget {
  const UsersTabView({super.key});

  // Github GraphQL query is quite slow that's why we limit the results to 10
  final limit = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTerm = ref.watch(searchTermProvider);

    return Query(
      options: QueryOptions(
        document: gql(searchUsers),
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

        if (result.data?['search']?['userCount'] == 0) {
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

        final users = result.data?['search']?['edges'];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResultsCount(
              searchTerm: searchTerm,
              // TODO: Implement Pagination later
              // resultsCount: result.data?['search']?['userCount'] ?? 0,
              resultsCount: users.length,
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return UserCard(
                    user: users[index]?['node'],
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
