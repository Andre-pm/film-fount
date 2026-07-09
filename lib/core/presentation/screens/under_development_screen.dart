import 'package:film_fount/core/domain/enums/menu_option.dart';
import 'package:film_fount/core/presentation/widgets/menu_bar_widget.dart';
import 'package:film_fount/core/presentation/widgets/navbar_app_version_widget.dart';
import 'package:film_fount/core/utils/platform_utils.dart';
import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class UnderDevelopmentScreen extends StatelessWidget {
  final MenuOptions selectedOption;
  final IconData icon;
  const UnderDevelopmentScreen({
    super.key,
    required this.selectedOption,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final bool isAppVersion = isPwa();

    return Scaffold(
      bottomNavigationBar: isAppVersion
          ? NavBarAppVersionWidget(
              theme: theme,
              strings: strings,
              selectedIndex: 3,
            )
          : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isLargeVersion = constraints.maxWidth > 1200;

          return CustomScrollView(
            slivers: [
              isAppVersion
                  ? SliverToBoxAdapter(child: SizedBox.shrink())
                  : MenuBarWidget(
                      isLargeVersion: isLargeVersion,
                      option: selectedOption,
                    ),
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        size: 50,
                        icon,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      Text(
                        strings.underDevelopmentTitle(
                          getMenuOptionTitle(selectedOption, strings),
                        ),
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        strings.underDevelopmentSubtitle,
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

String getMenuOptionTitle(MenuOptions options, AppLocalizations strings) {
  switch (options) {
    case MenuOptions.search:
      return strings.menuOptionSearch;
    case MenuOptions.profile:
      return strings.menuOptionProfile;
    case MenuOptions.library:
      return strings.menuOptionLibrary;
    case MenuOptions.goals:
      return strings.menuOptionGoals;
  }
}
