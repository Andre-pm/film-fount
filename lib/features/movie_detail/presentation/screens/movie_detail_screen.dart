import 'package:film_fount/features/movie_detail/presentation/providers/movie_detail_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailScreen extends ConsumerWidget {
  final int movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetailState = ref.watch(movieDetailNotifierProvider(movieId));
    final movieDetailNotifier = ref.read(
      movieDetailNotifierProvider(movieId).notifier,
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
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Image.network(
                      data.backdropPath ?? '',
                      fit: BoxFit.cover,
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
                    child: SizedBox(
                      height: 150,
                      width: 100,
                      child: Image.network(
                        data.posterPath ?? '',
                        fit: BoxFit.cover,
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
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  data.overview ?? '',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
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
                          ? 'Remover da lista'
                          : 'Adicionar a lista',
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
            ],
          ),
        ),
      ),
      error: (error) => Scaffold(body: Container()),
    );
  }
}
