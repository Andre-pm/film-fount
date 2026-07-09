import 'package:film_fount/core/domain/enums/menu_option.dart';
import 'package:film_fount/core/presentation/extensions/menu_options_extensions.dart';
import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarAppVersionWidget extends StatelessWidget {
  const NavBarAppVersionWidget({
    super.key,
    required this.theme,
    required this.strings,
    required this.selectedIndex,
  });

  final ThemeData theme;
  final AppLocalizations strings;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: theme.colorScheme.surface,
      indicatorColor: theme.colorScheme.secondary,
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(
            color: theme.colorScheme.secondary,
            fontWeight: FontWeight.bold,
          );
        }
        return TextStyle(color: theme.colorScheme.tertiary);
      }),
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      selectedIndex: selectedIndex,
      onDestinationSelected: (int index) {
        if (index == 0) {
          Navigator.of(context).pushReplacementNamed(MenuOptions.search.route);
        } else if (index == 1) {
          Navigator.of(context).pushReplacementNamed(MenuOptions.profile.route);
        } else if (index == 2) {
          Navigator.of(context).pushReplacementNamed(MenuOptions.library.route);
        } else if (index == 3) {
          Navigator.of(context).pushReplacementNamed(MenuOptions.goals.route);
        }
      },
      destinations: [
        NavigationDestination(
          icon: Icon(
            size: 35,
            Icons.search,
            color: selectedIndex == 0
                ? theme.colorScheme.onSurface
                : theme.colorScheme.tertiary,
          ),
          label: strings.menuOptionSearch,
        ),
        NavigationDestination(
          icon: Icon(
            size: 35,
            Icons.person,
            color: selectedIndex == 1
                ? theme.colorScheme.onSurface
                : theme.colorScheme.tertiary,
          ),
          label: strings.menuOptionProfile,
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            height: 30,
            'assets/svg/library.svg',
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(
              selectedIndex == 2
                  ? theme.colorScheme.onSurface
                  : theme.colorScheme.tertiary,
              BlendMode.srcIn,
            ),
          ),
          label: strings.menuOptionLibrary,
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            height: 25,
            'assets/svg/goals.svg',
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(
              selectedIndex == 3
                  ? theme.colorScheme.onSurface
                  : theme.colorScheme.tertiary,
              BlendMode.srcIn,
            ),
          ),
          label: strings.menuOptionGoals,
        ),
      ],
    );
  }
}
