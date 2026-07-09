import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_fount/core/domain/enums/menu_option.dart';
import 'package:film_fount/core/presentation/providers/core_providers.dart';
import 'package:film_fount/core/presentation/widgets/menu_bar_widget.dart';
import 'package:film_fount/core/presentation/widgets/navbar_app_version_widget.dart';
import 'package:film_fount/core/utils/platform_utils.dart';
import 'package:film_fount/features/library/presentation/providers/library_providers.dart';
import 'package:film_fount/features/library/presentation/widgets/empty_library_state.dart';
import 'package:film_fount/features/library/presentation/widgets/library_category_selector.dart';
import 'package:film_fount/features/library/presentation/widgets/pwa_warning_widget.dart';
import 'package:film_fount/features/movie_detail/presentation/events/watch_list_updated_event.dart';
import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web/web.dart' as web;

class LibraryScreen extends ConsumerStatefulWidget {
  const LibraryScreen({super.key});

  @override
  ConsumerState<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends ConsumerState<LibraryScreen> {
  late StreamSubscription _watchListSub;
  late int selectedOption;
  late bool closeWarningDisplayed;
  late bool isAppVersion;

  @override
  void initState() {
    super.initState();
    selectedOption = 0;
    final storedValue = web.window.localStorage.getItem(
      'closeWarningDisplayed',
    );
    closeWarningDisplayed = storedValue == 'true';
    _watchListSub = ref
        .read(eventBusProvider)
        .on<WatchListUpdatedEvent>()
        .listen((event) {
          ref.read(libraryNotifierProvider.notifier).fetchWatchList(true);
          selectedOption = 0;
        });
    isAppVersion = isPwa();
  }

  @override
  void dispose() {
    _watchListSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final libraryState = ref.watch(libraryNotifierProvider);
    final libraryNotifier = ref.read(libraryNotifierProvider.notifier);
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: isAppVersion
          ? NavBarAppVersionWidget(
              theme: theme,
              strings: strings,
              selectedIndex: 2,
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
                      option: MenuOptions.library,
                    ),
              SliverToBoxAdapter(
                child: isMobile() || closeWarningDisplayed
                    ? SizedBox.shrink()
                    : PwaWarningWidget(
                        isMobileDevice: isMobile(),
                        onClose: () =>
                            setState(() => closeWarningDisplayed = true),
                      ),
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
                        child: LibraryCategorySelector(
                          selectedOption: selectedOption,
                          onOptionSelected: (index) {
                            setState(() {
                              selectedOption = index;
                              if (index == 0) {
                                libraryNotifier.changeWatchListView(null);
                              }
                              if (index == 1) {
                                libraryNotifier.changeWatchListView(true);
                              }
                              if (index == 2) {
                                libraryNotifier.changeWatchListView(false);
                              }
                            });
                          },
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
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color.fromRGBO(22, 22, 22, 1),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      imageUrl: watchListItem.posterPath!,
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
                            child: EmptyLibraryState(
                              selectedOption: selectedOption,
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
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          strings.libraryEmptySubtitle,
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
