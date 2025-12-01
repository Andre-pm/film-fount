import 'dart:async';
import 'dart:ui';

import 'package:film_fount/core/domain/enums/menu_option.dart';
import 'package:film_fount/core/presentation/providers/core_providers.dart';
import 'package:film_fount/core/presentation/widgets/menu_bar_widget.dart';
import 'package:film_fount/features/library/presentation/providers/library_providers.dart';
import 'package:film_fount/features/movie_detail/presentation/events/watch_list_updated_event.dart';
import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LibraryScreen extends ConsumerStatefulWidget {
  const LibraryScreen({super.key});

  @override
  ConsumerState<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends ConsumerState<LibraryScreen> {
  late StreamSubscription _watchListSub;
  late int selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = 0;
    _watchListSub = ref
        .read(eventBusProvider)
        .on<WatchListUpdatedEvent>()
        .listen((event) {
          setState(() {
            ref.read(libraryNotifierProvider.notifier).fetchWatchList();
            selectedOption = 0;
          });
        });
  }

  @override
  void dispose() {
    _watchListSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final libraryState = ref.watch(libraryNotifierProvider);
    final libraryNotifier = ref.read(libraryNotifierProvider.notifier);
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isLargeScreen = constraints.maxWidth > 1200;
          return CustomScrollView(
            slivers: [
              MenuBarWidget(
                isLargeVersion: isLargeScreen,
                option: MenuOptions.library,
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
                        strings.libraryTitle,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        strings.librarySubtitle,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SizedBox(
                    width: screenWidth,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                          PointerDeviceKind.trackpad,
                        },
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            spacing: 15,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    selectedOption = 0;
                                    libraryNotifier.changeWatchListView(null);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    color: selectedOption == 0
                                        ? Theme.of(
                                            context,
                                          ).colorScheme.secondary
                                        : const Color.fromARGB(
                                            255,
                                            159,
                                            159,
                                            159,
                                          ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(strings.libraryAllSection),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    selectedOption = 1;
                                    libraryNotifier.changeWatchListView(true);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    color: selectedOption == 1
                                        ? Theme.of(
                                            context,
                                          ).colorScheme.secondary
                                        : const Color.fromARGB(
                                            255,
                                            159,
                                            159,
                                            159,
                                          ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(strings.libraryWatchedSection),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    selectedOption = 2;
                                    libraryNotifier.changeWatchListView(false);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    color: selectedOption == 2
                                        ? Theme.of(
                                            context,
                                          ).colorScheme.secondary
                                        : const Color.fromARGB(
                                            255,
                                            159,
                                            159,
                                            159,
                                          ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(strings.libraryNotWatchedSection),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              libraryState.when(
                initial: () => SliverToBoxAdapter(child: SizedBox.shrink()),
                loading: () => SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                ),
                data: (data) {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                    sliver: data.watchList!.isNotEmpty
                        ? SliverGrid(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              final watchListItem = data.watchList![index];
                              return InkWell(
                                onTap: () => Navigator.of(context).pushNamed(
                                  '/movie_details',
                                  arguments: watchListItem.id,
                                ),
                                child: watchListItem.posterPath != null
                                    ? Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          color: Color.fromRGBO(22, 22, 22, 1),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          child: Image.network(
                                            watchListItem.posterPath!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : const Icon(Icons.image_not_supported),
                              );
                            }, childCount: data.watchList!.length),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: isLargeScreen ? 8 : 3,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: isLargeScreen
                                      ? 165 / 245.5
                                      : 100 / 150,
                                ),
                          )
                        : SliverFillRemaining(
                            child: Container(
                              color: Color.fromRGBO(38, 38, 38, 1),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    selectedOption == 1
                                        ? strings
                                              .libraryWatchedSectionEmptyTitle
                                        : strings
                                              .libraryNotWatchedSectionEmptyTitle,
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    selectedOption == 1
                                        ? strings
                                              .libraryWatchedSectionEmptyDescription
                                        : strings
                                              .libraryNotWatchedSectionEmptyDescription,
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                  );
                },
                error: (e) => SliverFillRemaining(
                  child: Container(
                    color: Color.fromRGBO(38, 38, 38, 1),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          strings.libraryEmptyTitle,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          strings.libraryEmptySubtitle,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
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
