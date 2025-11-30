import 'dart:async';

import 'package:film_fount/core/domain/enums/menu_option.dart';
import 'package:film_fount/core/presentation/providers/core_providers.dart';
import 'package:film_fount/core/presentation/widgets/menu_bar_widget.dart';
import 'package:film_fount/features/library/presentation/providers/library_providers.dart';
import 'package:film_fount/features/movie_detail/presentation/events/watchlist_updated_event.dart';
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

  @override
  void initState() {
    super.initState();
    _watchListSub = ref
        .read(eventBusProvider)
        .on<WatchListUpdatedEvent>()
        .listen(
          (event) =>
              ref.read(libraryNotifierProvider.notifier).fetchWatchList(),
        );
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

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isLargeVersion = constraints.maxWidth > 1200;
          return CustomScrollView(
            slivers: [
              MenuBarWidget(
                isLargeVersion: isLargeVersion,
                option: MenuOptions.library,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 25,
                  ),
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
              libraryState.when(
                initial: () => SliverToBoxAdapter(child: SizedBox.shrink()),
                loading: () => SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                ),
                data: (data) => SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final watchListItem = data.watchList?[index];
                    return InkWell(
                      onTap: () => Navigator.of(context).pushNamed(
                        '/movie_details',
                        arguments: watchListItem?.id,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 15,
                        ),
                        child: Row(
                          children: [
                            if (watchListItem?.posterPath != null)
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                                child: Image.network(
                                  watchListItem!.posterPath!,
                                  width: 100,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              )
                            else
                              const SizedBox(
                                width: 100,
                                height: 150,
                                child: Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey,
                                ),
                              ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    watchListItem?.title ?? '',
                                    softWrap: true,
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    watchListItem?.watched == true
                                        ? strings.libraryMovieIsWatched
                                        : strings.libraryMovieIsNotWatched,
                                    style: TextStyle(
                                      color: watchListItem?.watched == true
                                          ? Color.fromRGBO(108, 255, 120, 1)
                                          : Color.fromRGBO(255, 116, 108, 1),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }, childCount: data.watchList?.length),
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
