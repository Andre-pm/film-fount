import 'package:film_fount/core/domain/enums/menu_option.dart';
import 'package:film_fount/core/presentation/extensions/string_extensions.dart';
import 'package:film_fount/core/presentation/widgets/menu_bar_widget.dart';
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

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isLargeVersion = constraints.maxWidth > 1200;

          return LayoutBuilder(
            builder: (context, constraints) => CustomScrollView(
              slivers: <Widget>[
                MenuBarWidget(
                  isLargeVersion: isLargeVersion,
                  option: MenuOptions.profile,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: state.when(
                      initial: () =>
                          const Center(child: CircularProgressIndicator()),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
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
