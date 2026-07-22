import 'package:film_fount/core/domain/enums/menu_option.dart';
import 'package:film_fount/core/presentation/extensions/string_extensions.dart';
import 'package:film_fount/core/presentation/widgets/menu_bar_widget.dart';
import 'package:film_fount/core/presentation/widgets/navbar_app_version_widget.dart';
import 'package:film_fount/core/utils/platform_utils.dart';
import 'package:film_fount/features/auth/presentation/providers/auth_provider.dart';
import 'package:film_fount/features/movie_detail/presentation/widgets/action_button_widget.dart';
import 'package:film_fount/features/profile/presentation/providers/profile_providers.dart';
import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileNotifierProvider);
    final notifier = ref.read(profileNotifierProvider.notifier);
    final strings = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final bool isAppVersion = isPwa();

    Future<void> handleLogout(BuildContext context) async {
      final authControllerNotifier = ref.read(authNotifierProvider.notifier);
      final success = await authControllerNotifier.signOut();
      if (success && context.mounted) {
        Navigator.of(context).pushReplacementNamed('/');
      }
    }

    return Scaffold(
      bottomNavigationBar: isAppVersion
          ? NavBarAppVersionWidget(
              theme: theme,
              strings: strings,
              selectedIndex: 1,
            )
          : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isLargeVersion = constraints.maxWidth > 1200;

          return LayoutBuilder(
            builder: (context, constraints) => CustomScrollView(
              slivers: <Widget>[
                isAppVersion
                    ? SliverToBoxAdapter(child: SizedBox.shrink())
                    : MenuBarWidget(
                        isLargeVersion: isLargeVersion,
                        option: MenuOptions.profile,
                      ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: state.when(
                      initial: () => Center(
                        child: CircularProgressIndicator(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                      loading: () => Center(
                        child: CircularProgressIndicator(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                      data: (user) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey[200],
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: user.photoURL.orEmpty,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.person, size: 50),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            user.displayName.orEmpty,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(user.email.orEmpty),
                          SizedBox(height: 50),
                          actionButtonWidget(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: AlertDialog(
                                      title: Text(
                                        strings.profileDeleteDialogTitle,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: theme.primaryColor,
                                        ),
                                      ),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            Text(
                                              strings
                                                  .profileDeleteDialogSubtitle,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    theme.colorScheme.secondary,
                                              ),
                                            ),
                                            Text(
                                              strings
                                                  .profileDeleteDialogDescription,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: theme.primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text(
                                            strings.profileDeleteDialogCancel,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  theme.colorScheme.secondary,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text(
                                            strings.profileDeleteDialogConfirm,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  theme.colorScheme.secondary,
                                            ),
                                          ),
                                          onPressed: () {
                                            notifier.deleteAccount(() {
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    strings.accountDeletedAlert,
                                                  ),
                                                ),
                                              );
                                              if (context.mounted) {
                                                Navigator.of(
                                                  context,
                                                ).pushReplacementNamed(
                                                  '/login',
                                                );
                                              }
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            buttonColor: Color.fromRGBO(255, 116, 108, 1),
                            title: strings.profileDeleteAccountButton,
                            icon: Icons.delete,
                          ),
                          actionButtonWidget(
                            onTap: () {
                              handleLogout(context);
                            },
                            buttonColor: theme.colorScheme.tertiary,
                            title: strings.menuOptionLogout,
                            icon: Icons.exit_to_app,
                          ),
                        ],
                      ),
                      error: (error) =>
                          Center(child: Text(strings.screenLoadError)),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
