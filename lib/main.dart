import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/api.dart';
import 'package:flutter_github_app/constants/colors.dart';
import 'package:flutter_github_app/constants/keys.dart';
import 'package:flutter_github_app/screens/app_container.dart';
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
      child: const MyApp(),
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        useMaterial3: false,
        scaffoldBackgroundColor: grey100,
        appBarTheme: const AppBarTheme(
          backgroundColor: grey100,
          foregroundColor: grey600,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: grey600,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          iconTheme: IconThemeData(
            color: secondaryColor,
            size: 24,
          ),
        ),
        iconTheme: const IconThemeData(
          color: secondaryColor,
          size: 24,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: secondaryColor,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(
            color: primaryColor,
            size: 24,
          ),
          unselectedIconTheme: IconThemeData(
            color: secondaryColor,
            size: 24,
          ),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: primaryColor,
          unselectedLabelColor: grey400,
          labelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: primaryColor,
              ),
            ),
          ),
        ),
      ),
      navigatorKey: outerAppNavKey,
      routes: {
        AppContainer.routeName: (context) => const AppContainer(),
      },
    );
  }
}
