import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/secrets.dart';
import 'package:flutter_github_app/constants/keys.dart';
import 'package:flutter_github_app/constants/themes.dart';
import 'package:flutter_github_app/screens/app_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await initHiveForFlutter();

  final GraphQLClient graphQLClient = GraphQLClient(
    link: HttpLink(
      'https://api.github.com/graphql',
      defaultHeaders: {
        'Authorization': 'bearer $githubToken',
      },
    ),
    cache: GraphQLCache(
      store: HiveStore(),
    ),
  );

  final client = ValueNotifier(graphQLClient);

  runApp(
    GraphQLProvider(
      client: client,
      child: const ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github App',
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: ThemeMode.light,
      navigatorKey: outerAppNavKey,
      routes: {
        AppContainer.routeName: (context) => const AppContainer(),
      },
    );
  }
}
