import 'package:film_fount/core/presentation/extensions/movie_status_extensions.dart';
import 'package:film_fount/core/presentation/extensions/string_extensions.dart';
import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';
import 'package:film_fount/features/movie_detail/presentation/providers/movie_detail_providers.dart';
import 'package:film_fount/features/movie_detail/presentation/widgets/action_button_widget.dart';
import 'package:film_fount/features/movie_detail/presentation/widgets/related_movies_widget.dart';
import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailScreen extends ConsumerStatefulWidget {
  final int movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  ConsumerState<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MovieDetailScreen> {
  final ScrollController _similarMoviesScrollController = ScrollController();
  final ScrollController _recommendationScrollController = ScrollController();
  bool isLoadingMoreSimilarMovies = false;
  bool isMoreSimilarMovies = true;
  bool isLoadingMoreRecommendations = false;
  bool isMoreRecommendations = true;
  @override
  void initState() {
    super.initState();
    _similarMoviesScrollController.addListener(() {
      final max = _similarMoviesScrollController.position.maxScrollExtent;
      final current = _similarMoviesScrollController.position.pixels;

      if (!isLoadingMoreSimilarMovies && current > max - 200) {
        setState(() {
          isLoadingMoreSimilarMovies = true;
        });
        ref
            .read(movieDetailNotifierProvider(widget.movieId).notifier)
            .loadMoreSimilarMovies()
            .then((hasMore) {
              isMoreSimilarMovies = hasMore;
              isLoadingMoreSimilarMovies = false;
            });
      }
    });

    _recommendationScrollController.addListener(() {
      final max = _recommendationScrollController.position.maxScrollExtent;
      final current = _recommendationScrollController.position.pixels;

      if (!isLoadingMoreRecommendations && current > max - 200) {
        setState(() {
          isLoadingMoreRecommendations = true;
        });
        ref
            .read(movieDetailNotifierProvider(widget.movieId).notifier)
            .loadMoreRecommendations()
            .then((hasMore) {
              isMoreRecommendations = hasMore;
              isLoadingMoreRecommendations = false;
            });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _similarMoviesScrollController.dispose();
    _recommendationScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final widthSizeScreen = MediaQuery.of(context).size.width;
    final movieDetailState = ref.watch(
      movieDetailNotifierProvider(widget.movieId),
    );
    final movieDetailNotifier = ref.read(
      movieDetailNotifierProvider(widget.movieId).notifier,
    );

    return movieDetailState.when(
      initial: () => Scaffold(body: Container()),
      loading: () => Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: theme.colorScheme.secondary),
        ),
      ),
      data: (data) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isLargeScreen = constraints.maxWidth > 1200;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          child: data.backdropPath != null
                              ? SizedBox(
                                  width: widthSizeScreen,
                                  height: 300,
                                  child: Image.network(
                                    data.backdropPath!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : SizedBox(
                                  width: widthSizeScreen,
                                  height: 300,
                                  child: Image.asset(
                                    'assets/images/default_banner.png',
                                  ),
                                ),
                        ),
                        Positioned(
                          top: 110,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 250,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Color.fromRGBO(30, 30, 30, 1),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 140,
                          left: 25,
                          child: data.posterPath != null
                              ? SizedBox(
                                  height: 150,
                                  width: 100,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    child: Image.network(
                                      data.posterPath!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                  height: 150,
                                  width: 100,
                                  child: Icon(
                                    Icons.image_not_supported,
                                    color: Colors.grey,
                                  ),
                                ),
                        ),
                        Positioned(
                          top: 190,
                          left: 140,
                          right: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.title.orEmpty,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                data.originalTitle.orEmpty,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(38, 38, 38, 1),
                            ),
                            child: Text(
                              data.runtime != null
                                  ? strings.movieDetailRuntime(data.runtime!)
                                  : strings.movieDetailRuntimeNotFound,
                              softWrap: true,
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: switch (data.status) {
                                    MovieStatus.released => Color.fromRGBO(
                                      108,
                                      255,
                                      120,
                                      1,
                                    ),
                                    MovieStatus.production => Color.fromRGBO(
                                      255,
                                      221,
                                      108,
                                      1,
                                    ),

                                    MovieStatus.unknown => Color.fromRGBO(
                                      226,
                                      226,
                                      226,
                                      1,
                                    ),
                                    null => Color.fromRGBO(226, 226, 226, 1),
                                  },
                                ),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        (data.status?.getName(context)).orEmpty,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        (data.releaseDate?.toDayMonthInWords(
                                          context,
                                        )).orEmpty,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  data.overview != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            data.overview!,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SizedBox(
                            width: widthSizeScreen,
                            child: Center(
                              child: InkWell(
                                onTap: () async {
                                  final movieFormatted = data.title?.replaceAll(
                                    ' ',
                                    '+',
                                  );
                                  if (!await launchUrl(
                                    Uri.parse(
                                      "https://www.google.com/search?q=$movieFormatted+movie+${data.releaseDate?.toYear()}",
                                    ),
                                    webOnlyWindowName: '_blank',
                                  )) {
                                    throw Exception(strings.footerException);
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(22, 22, 22, 1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        strings
                                            .movieDetailDescriptionNotFoundTitle,
                                        style: TextStyle(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.secondary,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 25),
                                      if (data.title != null)
                                        Text(
                                          strings
                                              .movieDetailDescriptionNotFoundDescription(
                                                data.title!,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 25),
                  isLargeScreen
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            actionButtonWidget(
                              onTap: () {
                                if (data.isInWatchList) {
                                  movieDetailNotifier.removeFromWatchList(data);
                                  if (data.isWatched) {
                                    movieDetailNotifier.isWatched(
                                      data.id,
                                      false,
                                    );
                                  }
                                } else {
                                  movieDetailNotifier.addToWatchList(data);
                                }
                              },
                              buttonColor: data.isInWatchList
                                  ? Color.fromRGBO(255, 116, 108, 1)
                                  : Color.fromRGBO(108, 255, 120, 1),
                              title: data.isInWatchList
                                  ? strings.movieDetailRemoveLibrary
                                  : strings.movieDetailAddLibrary,
                              icon: data.isInWatchList
                                  ? Icons.remove_circle_outline
                                  : Icons.add,
                            ),

                            actionButtonWidget(
                              onTap: () {
                                data.isInWatchList
                                    ? movieDetailNotifier.isWatched(
                                        data.id,
                                        !data.isWatched,
                                      )
                                    : movieDetailNotifier
                                          .addToWatchList(data)
                                          .then(
                                            (_) =>
                                                movieDetailNotifier.isWatched(
                                                  data.id,
                                                  !data.isWatched,
                                                ),
                                          );
                              },
                              buttonColor: data.isWatched
                                  ? Color.fromRGBO(247, 169, 100, 1)
                                  : Color.fromRGBO(145, 145, 145, 1),
                              title: data.isWatched
                                  ? strings.movieDetailWatchedButton
                                  : strings.movieDetailNotWatchedButton,
                              icon: data.isWatched
                                  ? Icons.remove_red_eye_rounded
                                  : Icons.remove_red_eye_outlined,
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            actionButtonWidget(
                              onTap: () {
                                if (data.isInWatchList) {
                                  movieDetailNotifier.removeFromWatchList(data);
                                  if (data.isWatched) {
                                    movieDetailNotifier.isWatched(
                                      data.id,
                                      false,
                                    );
                                  }
                                } else {
                                  movieDetailNotifier.addToWatchList(data);
                                }
                              },
                              buttonColor: data.isInWatchList
                                  ? Color.fromRGBO(255, 116, 108, 1)
                                  : Color.fromRGBO(108, 255, 120, 1),
                              title: data.isInWatchList
                                  ? strings.movieDetailRemoveLibrary
                                  : strings.movieDetailAddLibrary,
                              icon: data.isInWatchList
                                  ? Icons.remove_circle_outline
                                  : Icons.add,
                            ),

                            actionButtonWidget(
                              onTap: () {
                                data.isInWatchList
                                    ? movieDetailNotifier.isWatched(
                                        data.id,
                                        !data.isWatched,
                                      )
                                    : movieDetailNotifier
                                          .addToWatchList(data)
                                          .then(
                                            (_) =>
                                                movieDetailNotifier.isWatched(
                                                  data.id,
                                                  !data.isWatched,
                                                ),
                                          );
                              },
                              buttonColor: data.isWatched
                                  ? Color.fromRGBO(247, 169, 100, 1)
                                  : Color.fromRGBO(145, 145, 145, 1),
                              title: data.isWatched
                                  ? strings.movieDetailWatchedButton
                                  : strings.movieDetailNotWatchedButton,
                              icon: data.isWatched
                                  ? Icons.remove_red_eye_rounded
                                  : Icons.remove_red_eye_outlined,
                            ),
                          ],
                        ),

                  SizedBox(height: 50),

                  relatedMoviesWidget(
                    context,
                    scrollController: _similarMoviesScrollController,
                    isLoadingMore: isLoadingMoreSimilarMovies,
                    title: strings.movieDetailSimilarMovieTitle,
                    description: strings.movieDetailSimilarMovieDescription,
                    movieList: data.similarMovies ?? [],
                    hasMore: isMoreSimilarMovies,
                  ),
                  relatedMoviesWidget(
                    context,
                    scrollController: _recommendationScrollController,
                    isLoadingMore: isLoadingMoreRecommendations,
                    title: strings.movieDetailRecommendationsTitle,
                    description: strings.movieDetailRecommendationsDescription,
                    movieList: data.recommendations ?? [],
                    hasMore: isMoreRecommendations,
                  ),
                  SizedBox(height: 35),
                ],
              ),
            );
          },
        ),
      ),
      error: (error) => Scaffold(body: Container()),
    );
  }
}
