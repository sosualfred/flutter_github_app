import 'package:flutter/material.dart';
import 'package:flutter_github_app/constants/colors.dart';
import 'package:flutter_github_app/constants/keys.dart';
import 'package:flutter_github_app/screens/analytics_screen.dart';
import 'package:flutter_github_app/screens/home_screen.dart';
import 'package:flutter_github_app/screens/settings_screen.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({super.key});

  static const routeName = '/';

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Navigator(
        key: innerAppNavKey,
        initialRoute: HomeScreen.routeName,
        onGenerateRoute: (settings) {
          Widget page;

          switch (settings.name) {
            case HomeScreen.routeName:
              page = const HomeScreen();
              break;
            case AnalyticsScreen.routeName:
              page = const AnalyticsScreen();
              break;
            case SettingsScreen.routeName:
              page = const SettingsScreen();
              break;
            default:
              page = const HomeScreen();
          }

          return PageRouteBuilder(
            pageBuilder: (_, __, ___) => page,
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: secondaryColor,
              spreadRadius: 0,
              blurRadius: 5,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            currentIndex: currentTabIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Iconsax.home_1),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.user),
                label: 'Analytics',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.setting_2),
                label: 'Settings',
              ),
            ],
            onTap: (value) {
              setState(() {
                currentTabIndex = value;
              });
              switch (value) {
                case 0:
                  innerAppNavKey.currentState!
                      .pushReplacementNamed(HomeScreen.routeName);
                  break;
                case 1:
                  innerAppNavKey.currentState!
                      .pushReplacementNamed(AnalyticsScreen.routeName);
                  break;
                case 2:
                  innerAppNavKey.currentState!
                      .pushReplacementNamed(SettingsScreen.routeName);
                  break;
                default:
                  innerAppNavKey.currentState!
                      .pushReplacementNamed(HomeScreen.routeName);
              }
            },
          ),
        ),
      ),
    );
  }
}
