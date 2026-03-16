import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_fount/core/domain/enums/menu_option.dart';
import 'package:film_fount/core/presentation/widgets/menu_bar_widget.dart';
import 'package:film_fount/features/goals/presentation/providers/goal_providers.dart';
import 'package:film_fount/features/goals/presentation/screens/goal_movie_selection.dart';
import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoalScreen extends ConsumerWidget {
  const GoalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final goalState = ref.watch(goalsNotifierProvider);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isLargeVersion = constraints.maxWidth >= 1200;
          return CustomScrollView(
            slivers: [
              MenuBarWidget(
                isLargeVersion: isLargeVersion,
                option: MenuOptions.goals,
              ),
              goalState.when(
                initial: () => SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                ),
                loading: () => SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                ),
                data: (data) => SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                  sliver: data.goals!.isEmpty
                      ? SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 25),
                              Text(
                                'Metas',
                                style: theme.textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isLargeVersion ? 50 : 10,
                                  vertical: 55,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () => Navigator.of(
                                    context,
                                  ).pushNamed('/create_goal'),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color.fromRGBO(38, 38, 38, 1),
                                    ),
                                    height: constraints.maxHeight * 0.2,
                                    width: constraints.maxWidth * 0.9,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add_box_rounded,
                                          size: 35,
                                          color: theme.colorScheme.onSurface
                                              .withAlpha(150),
                                        ),
                                        SizedBox(height: 15),
                                        Text(
                                          'Adicionar meta',
                                          style: TextStyle(
                                            color: theme.colorScheme.onSurface
                                                .withAlpha(150),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SliverGrid(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            final goal = data.goals![index];
                            return InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () => (),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color.fromRGBO(22, 22, 22, 1),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        goal.movies?.first.posterPath ?? '',
                                    fit: BoxFit.cover,
                                    memCacheHeight: 400,
                                    placeholder: (context, url) => Container(
                                      color: Color.fromRGBO(22, 22, 22, 1),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.image_not_supported),
                                  ),
                                ),
                              ),
                            );
                          }, childCount: data.goals!.length),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: isLargeVersion ? 8 : 3,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 10,
                                childAspectRatio: isLargeVersion
                                    ? 165 / 245.5
                                    : 100 / 150,
                              ),
                        ),
                ),
                error: (e) => SliverFillRemaining(
                  child: Container(
                    color: Color.fromRGBO(38, 38, 38, 1),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Sem nenhuma Meta ainda',
                          style: TextStyle(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Crie agora sua primeira meta para acompanhar seus objetivos!',
                          style: TextStyle(color: theme.colorScheme.onSurface),
                        ),
                      ],
                    ),
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
