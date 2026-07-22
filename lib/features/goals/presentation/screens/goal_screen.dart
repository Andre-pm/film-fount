import 'package:film_fount/core/domain/enums/menu_option.dart';
import 'package:film_fount/core/presentation/extensions/string_extensions.dart';
import 'package:film_fount/core/presentation/widgets/menu_bar_widget.dart';
import 'package:film_fount/core/presentation/widgets/navbar_app_version_widget.dart';
import 'package:film_fount/core/utils/platform_utils.dart';
import 'package:film_fount/features/goals/presentation/providers/goal_providers.dart';
import 'package:film_fount/features/goals/presentation/widgets/goal_register_bottom_sheet.dart';
import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoalScreen extends ConsumerStatefulWidget {
  const GoalScreen({super.key});

  @override
  ConsumerState<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends ConsumerState<GoalScreen> {
  late bool isAppVersion;

  @override
  void initState() {
    super.initState();
    //TODO - Alterar para isPWA
    isAppVersion = isMobile();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final goalState = ref.watch(goalNotifierProvider);
    final goalNotifier = ref.read(goalNotifierProvider.notifier);

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
          final bool isLargeScreen = constraints.maxWidth > 1200;
          return CustomScrollView(
            slivers: [
              isAppVersion
                  ? SliverToBoxAdapter(child: SizedBox.shrink())
                  : MenuBarWidget(
                      isLargeVersion: isLargeScreen,
                      option: MenuOptions.goals,
                    ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 25,
                  ).copyWith(bottom: isLargeScreen ? 45 : 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Metas',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 15,
                ),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromRGBO(22, 22, 22, 1),
                        ),
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pessoais',
                              style: TextStyle(
                                color: theme.colorScheme.onSurface,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 15),
                            Center(
                              child: InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color.fromRGBO(38, 38, 38, 1),
                                  ),
                                  height: 150,
                                  width: 350,
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 50,
                                        color: theme.colorScheme.onSurface,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Adicionar Meta',
                                        style: TextStyle(
                                          color: theme.colorScheme.onSurface,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Crie uma meta pessoal',
                                        style: TextStyle(
                                          color: theme.colorScheme.onSurface,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  showModalBottomSheet(
                                    backgroundColor: Colors.black54,
                                    elevation: 10,
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) => FractionallySizedBox(
                                      heightFactor: 0.8,
                                      child: GoalRegisterBottomSheet(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            goalState.when(
                              initial: () => const Text('Initial'),
                              loading: () => Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                  child: Column(
                                    children: [
                                      CircularProgressIndicator(
                                        color: theme.colorScheme.secondary,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Carregando suas metas...',
                                        style: TextStyle(
                                          color: theme.colorScheme.onSurface,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              data: (data) => data.goals.isNotEmpty
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15,
                                      ),
                                      itemCount: data.goals.length,
                                      itemBuilder: (context, index) {
                                        final goal = data.goals[index];
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          child: InkWell(
                                            onTap: () {},
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Color.fromRGBO(
                                                  38,
                                                  38,
                                                  38,
                                                  1,
                                                ),
                                              ),
                                              width: 350,
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    goal.title,
                                                    style: TextStyle(
                                                      color: theme
                                                          .colorScheme
                                                          .onSurface,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                  SizedBox(height: 2),
                                                  Text(
                                                    (goal.description).orEmpty,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(height: 10),
                                                  ShaderMask(
                                                    shaderCallback: (Rect bounds) {
                                                      return const LinearGradient(
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                        colors: [
                                                          Colors.white,
                                                          Colors.white,
                                                          Colors.transparent,
                                                        ],
                                                        stops: [0.0, 0.8, 1.0],
                                                      ).createShader(bounds);
                                                    },
                                                    blendMode: BlendMode.dstIn,
                                                    child: SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      child: Row(
                                                        children: goal.movies.map((
                                                          movie,
                                                        ) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets.only(
                                                                  right: 10,
                                                                ),
                                                            child: InkWell(
                                                              onTap:
                                                                  () async {},
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      5,
                                                                    ),
                                                                child: Image.network(
                                                                  movie
                                                                      .posterPath
                                                                      .orEmpty,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  width: 35,
                                                                  height: 50,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "Filmes na meta: ${goal.movies.length}",
                                                    style: TextStyle(
                                                      color: theme
                                                          .colorScheme
                                                          .onSurface,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    goal.goalMessage.orEmpty,
                                                    style: TextStyle(
                                                      color: theme
                                                          .colorScheme
                                                          .onSurface,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    goal
                                                        .deadLineMessage
                                                        .orEmpty,
                                                    style: TextStyle(
                                                      color: theme
                                                          .colorScheme
                                                          .onSurface,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : const SizedBox.shrink(),
                              error: (_) => const Text('Error'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromRGBO(22, 22, 22, 1),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text(
                              'Comunitárias',
                              style: TextStyle(
                                color: theme.colorScheme.onSurface,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
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
