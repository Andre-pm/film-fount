import 'package:film_fount/core/domain/enums/menu_option.dart';
import 'package:film_fount/core/presentation/extensions/menu_options_ext.dart';
import 'package:film_fount/features/auth/presentation/providers/auth_provider.dart';
import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class MenuBarWidget extends ConsumerWidget {
  final bool isLargeVersion;
  final MenuOptions option;
  const MenuBarWidget({
    super.key,
    required this.isLargeVersion,
    required this.option,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context)!;

    Future<void> handleLogout(BuildContext context) async {
      final authControllerNotifier = ref.read(authNotifierProvider.notifier);
      final success = await authControllerNotifier.signOut();
      if (success && context.mounted) {
        Navigator.of(context).pushReplacementNamed('/');
      }
    }

    return SliverAppBar(
      titleSpacing: 100,
      leadingWidth: 100,
      floating: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 24),
        child: SvgPicture.asset('assets/svg/logo_navbar_horizontal.svg'),
      ),
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      actions: [
        isLargeVersion
            ? Row(
                children: [
                  PopupMenuButton<String>(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      strings.menuOptionProfile,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: option == MenuOptions.profile
                            ? Theme.of(context).colorScheme.secondary
                            : Color.fromRGBO(85, 85, 85, 0.749),
                      ),
                    ),
                    onSelected: (value) {
                      switch (value) {
                        case 'accessProfile':
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(MenuOptions.profile.route);
                          break;
                        case 'logout':
                          handleLogout(context);
                          break;
                        default:
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                          PopupMenuItem(
                            value: 'accessProfile',
                            child: Text(strings.menuOptionAccessProfile),
                          ),
                          PopupMenuItem(
                            value: 'logout',
                            child: Text(strings.menuOptionLogout),
                          ),
                        ],
                  ),
                  const SizedBox(width: 70),
                  InkWell(
                    onTap: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(MenuOptions.library.route);
                    },
                    hoverColor: Theme.of(context).colorScheme.onSurface,
                    splashColor: Theme.of(context).colorScheme.onSurface,
                    highlightColor: Theme.of(context).colorScheme.onSurface,
                    child: Text(
                      strings.menuOptionLibrary,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: option == MenuOptions.library
                            ? Theme.of(context).colorScheme.secondary
                            : Color.fromRGBO(85, 85, 85, 0.749),
                      ),
                    ),
                  ),
                  const SizedBox(width: 70),
                  InkWell(
                    onTap: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(MenuOptions.goals.route);
                    },
                    hoverColor: Theme.of(context).colorScheme.onSurface,
                    splashColor: Theme.of(context).colorScheme.onSurface,
                    highlightColor: Theme.of(context).colorScheme.onSurface,
                    child: Text(
                      strings.menuOptionGoals,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: option == MenuOptions.goals
                            ? Theme.of(context).colorScheme.secondary
                            : Color.fromRGBO(85, 85, 85, 0.749),
                      ),
                    ),
                  ),
                  const SizedBox(width: 70),
                  IconButton(
                    icon: Icon(Icons.search_rounded),
                    color: option == MenuOptions.search
                        ? Theme.of(context).colorScheme.secondary
                        : Color.fromRGBO(85, 85, 85, 0.749),
                    iconSize: 32,
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(MenuOptions.search.route);
                    },
                  ),
                ],
              )
            : Row(
                children: [
                  PopupMenuButton<String>(
                    color: Theme.of(context).colorScheme.secondary,
                    icon: Icon(Icons.menu),
                    onSelected: (value) {
                      switch (value) {
                        case 'profile':
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(MenuOptions.profile.route);
                          break;
                        case 'library':
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(MenuOptions.library.route);
                          break;
                        case 'goals':
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(MenuOptions.goals.route);
                          break;
                        case 'logout':
                          handleLogout(context);
                          break;
                        default:
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                          PopupMenuItem(
                            value: 'profile',
                            child: Text(strings.menuOptionProfile),
                          ),
                          PopupMenuItem(
                            value: 'library',
                            child: Text(strings.menuOptionLibrary),
                          ),
                          PopupMenuItem(
                            value: 'goals',
                            child: Text(strings.menuOptionGoals),
                          ),
                          PopupMenuItem(
                            value: 'logout',
                            child: Text(strings.menuOptionLogout),
                          ),
                        ],
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.search_rounded),
                    color: option == MenuOptions.search
                        ? Theme.of(context).colorScheme.secondary
                        : Color.fromRGBO(85, 85, 85, 0.749),
                    iconSize: 32,
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(MenuOptions.search.route);
                    },
                  ),
                ],
              ),
      ],
      actionsPadding: EdgeInsets.symmetric(horizontal: 24),
    );
  }
}
