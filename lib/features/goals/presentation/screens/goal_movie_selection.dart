import 'package:film_fount/core/presentation/extensions/string_extensions.dart';
import 'package:film_fount/features/search/domain/entities/movie_entity.dart';
import 'package:film_fount/features/search/presentation/providers/search_providers.dart';
import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoalMovieSelection extends ConsumerStatefulWidget {
  const GoalMovieSelection({super.key});

  @override
  ConsumerState<GoalMovieSelection> createState() => _GoalMovieSelectionState();
}

class _GoalMovieSelectionState extends ConsumerState<GoalMovieSelection> {
  final ScrollController _scrollController = ScrollController();
  bool isLoadingMore = false;
  bool hasMoreMovies = false;
  List<MovieEntity> selectedMovies = [];
  final ScrollController _selectedMoviesScrollController = ScrollController();
  final TextEditingController _movieController = TextEditingController();

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
    _selectedMoviesScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final strings = AppLocalizations.of(context)!;
    final state = ref.watch(movieSearchNotifierProvider);
    final notifier = ref.read(movieSearchNotifierProvider.notifier);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                titleSpacing: 100,
                leadingWidth: 100,
                floating: true,
                backgroundColor: Theme.of(context).colorScheme.onSurface,
                leading: BackButton(
                  color: Colors.black87,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 25,
                  ).copyWith(top: 25),
                  child: Text(
                    'Vamos criar uma nova meta',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: TextFormField(
                          controller: _movieController,
                          decoration: InputDecoration(
                            hintText: 'Insira o nome do filme',
                            hintStyle: TextStyle(
                              color: theme.colorScheme.onSurface.withAlpha(150),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                          ).copyWith(bottom: 15),
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
                      SizedBox(
                        height: constraints.maxHeight * 0.4,
                        child: CustomScrollView(
                          shrinkWrap: true,
                          controller: _scrollController,
                          slivers: [
                            state.when(
                              initial: () => const SliverToBoxAdapter(
                                child: SizedBox.shrink(),
                              ),
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
                                        child: Text(
                                          strings.searchMovieEmptyTitle,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return SliverList(
                                  delegate: SliverChildBuilderDelegate((
                                    context,
                                    index,
                                  ) {
                                    if (index == data.length) {
                                      if (!hasMoreMovies) {
                                        return SizedBox.shrink();
                                      }
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 50),
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                          ),
                                        ),
                                      );
                                    }
                                    final movie = data[index];
                                    return GestureDetector(
                                      onTap: () {
                                        selectedMovies.add(movie);
                                        setState(() {});
                                        _movieController.text = '';
                                        FocusScope.of(context).unfocus();
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                              if (_selectedMoviesScrollController
                                                  .hasClients) {
                                                _selectedMoviesScrollController
                                                    .animateTo(
                                                      _selectedMoviesScrollController
                                                          .position
                                                          .maxScrollExtent,
                                                      duration: const Duration(
                                                        milliseconds: 300,
                                                      ),
                                                      curve: Curves.easeOut,
                                                    );
                                              }
                                            });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 25,
                                          vertical: 8,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                              22,
                                              22,
                                              22,
                                              1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (movie.posterPath != null)
                                                ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(8),
                                                        bottomLeft:
                                                            Radius.circular(8),
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
                                                  padding: const EdgeInsets.all(
                                                    12,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        movie.title ??
                                                            strings
                                                                .searchMovieTitleNotFound,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Text(
                                                        movie
                                                                    .overview
                                                                    ?.isNotEmpty ==
                                                                true
                                                            ? movie.overview!
                                                            : strings
                                                                  .searchMovieDescriptionNotFound,
                                                        maxLines: 3,
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                child: Center(
                                  child: Text(strings.screenLoadError),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    left: 25,
                    right: 25,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54.withAlpha(50),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    height: constraints.maxHeight * 0.10,
                    child: selectedMovies.isEmpty
                        ? Center(
                            child: Text(
                              'Filmes selecionados',
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        : ListView.builder(
                            controller: _selectedMoviesScrollController,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: selectedMovies.length,
                            itemBuilder: (context, index) {
                              return selectedMovies.isEmpty
                                  ? SizedBox.shrink()
                                  : Stack(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 5,
                                          ),
                                          child:
                                              selectedMovies[index]
                                                      .posterPath ==
                                                  null
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                    color: Colors.black54,
                                                  ),
                                                  width: 100,
                                                  height: 150,
                                                  child: Icon(
                                                    Icons.image_not_supported,
                                                    color: Colors.grey,
                                                  ),
                                                )
                                              : ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                        Radius.circular(8),
                                                      ),
                                                  child: Image.network(
                                                    selectedMovies[index]
                                                        .posterPath
                                                        .orEmpty,
                                                    width: 100,
                                                    height: 150,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 10,
                                          child: GestureDetector(
                                            onTap: () {
                                              selectedMovies.removeAt(index);
                                              setState(() {});
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black54,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.close,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                            },
                          ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: selectedMovies.isNotEmpty
                    ? Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () => {
                            Navigator.pushNamed(
                              context,
                              '/goal_deadline',
                              arguments: selectedMovies,
                            ),
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Container(
                              width: 552,
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 24,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                  width: 1.5,
                                ),
                                color: Color.fromRGBO(31, 31, 31, 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Continuar',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ),
            ],
          );
        },
      ),
    );
  }
}
