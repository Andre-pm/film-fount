import 'dart:ui';

import 'package:film_fount/app/theme/app_theme.dart';
import 'package:film_fount/features/movie_detail/presentation/providers/movie_detail_providers.dart';
import 'package:film_fount/features/movie_detail/presentation/widgets/related_movies_widget.dart';
import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final movieDetailState = ref.watch(
      movieDetailNotifierProvider(widget.movieId),
    );
    final movieDetailNotifier = ref.read(
      movieDetailNotifierProvider(widget.movieId).notifier,
    );

    return movieDetailState.when(
      initial: () => Scaffold(body: Container()),
      loading: () => Scaffold(body: Center(child: CircularProgressIndicator())),
      data: (data) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      child: data.backdropPath != null
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                              child: Image.network(
                                data.backdropPath!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                              child: Image.asset(
                                'assets/images/default_banner.png',
                              ),
                            ),
                    ),
                    Positioned(
                      top: 200,
                      left: 0,
                      right: 0,
                      child: Container(
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
                        height: 100,
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
                                color: Theme.of(context).colorScheme.primary,
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
                      top: 220,
                      left: 130,
                      right: 0,
                      child: Text(
                        data.title ?? '',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  data.overview ?? '',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 25),
              InkWell(
                onTap: () {
                  if (data.isInWatchList == false) {
                    movieDetailNotifier.addToWatchList(data);
                  } else {
                    movieDetailNotifier.removeFromWatchList(data);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Container(
                    width: 552,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: data.isInWatchList == true
                            ? Color.fromRGBO(255, 116, 108, 1)
                            : Color.fromRGBO(108, 255, 120, 1),
                        width: 1.5,
                      ),
                      color: Color.fromRGBO(31, 31, 31, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      data.isInWatchList == true
                          ? strings.movieDetailRemoveLibrary
                          : strings.movieDetailAddLibrary,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: data.isInWatchList == true
                            ? Color.fromRGBO(255, 116, 108, 1)
                            : Color.fromRGBO(108, 255, 120, 1),
                      ),
                    ),
                  ),
                ),
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
        ),
      ),
      error: (error) => Scaffold(body: Container()),
    );
  }
}
