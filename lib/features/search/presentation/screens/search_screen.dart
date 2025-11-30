import 'package:film_fount/core/domain/enums/menu_option.dart';
import 'package:film_fount/core/presentation/widgets/menu_bar_widget.dart';
import 'package:film_fount/features/search/presentation/providers/search_providers.dart';
import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isLoadingMore = false;
  final TextEditingController _movieController = TextEditingController();
  bool hasMoreMovies = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final max = _scrollController.position.maxScrollExtent;
      final current = _scrollController.position.pixels;

      if (!isLoadingMore && current > max - 200) {
        setState(() {
          isLoadingMore = true;
        });
        ref
            .read(movieSearchNotifierProvider.notifier)
            .loadSearchNextPage()
            .then((hasMore) {
              setState(() {
                hasMoreMovies = hasMore;
                isLoadingMore = false;
              });
            });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _movieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final state = ref.watch(movieSearchNotifierProvider);
    final notifier = ref.read(movieSearchNotifierProvider.notifier);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isLargeVersion = constraints.maxWidth > 1200;

          return CustomScrollView(
            shrinkWrap: true,
            controller: _scrollController,
            slivers: <Widget>[
              MenuBarWidget(
                isLargeVersion: isLargeVersion,
                option: MenuOptions.search,
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
                        strings.searchTitle,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        strings.searchSubtitle,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 40,
                  ),
                  child: TextFormField(
                    controller: _movieController,
                    style: TextStyle(color: Color.fromRGBO(30, 30, 30, 1)),
                    decoration: InputDecoration(
                      labelText: strings.searchMovieTitle,
                      filled: true,
                      fillColor: Color.fromRGBO(241, 240, 236, 1),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ).copyWith(bottom: 50),
                  child: TextButton(
                    style: ButtonStyle(
                      textStyle: WidgetStateProperty.all<TextStyle>(
                        TextStyle(fontWeight: FontWeight.w600),
                      ),
                      backgroundColor: WidgetStateProperty.all<Color>(
                        Theme.of(context).colorScheme.secondary,
                      ),
                      foregroundColor: WidgetStateProperty.all<Color>(
                        Color.fromRGBO(31, 31, 31, 1),
                      ),
                    ),
                    onPressed: () =>
                        notifier.searchMovie(_movieController.text),
                    child: Text(
                      strings.searchMovieButton,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
              ),
              state.when(
                initial: () =>
                    const SliverToBoxAdapter(child: SizedBox.shrink()),
                loading: () => const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                data: (data) {
                  if (data.isEmpty) {
                    return SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Center(
                          child: Text(strings.searchMovieEmptyTitle),
                        ),
                      ),
                    );
                  }
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      if (index == data.length) {
                        if (!hasMoreMovies) return SizedBox.shrink();
                        return Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        );
                      }
                      final movie = data[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed('/movie_details', arguments: movie.id);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 8,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(22, 22, 22, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (movie.posterPath != null)
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                    child: Image.network(
                                      movie.posterPath!,
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

                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          movie.title ??
                                              strings.searchMovieTitleNotFound,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          movie.overview?.isNotEmpty == true
                                              ? movie.overview!
                                              : strings
                                                    .searchMovieDescriptionNotFound,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }, childCount: data.length + 1),
                  );
                },
                error: (_) => SliverToBoxAdapter(
                  child: Center(child: Text(strings.searchMovieError)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
