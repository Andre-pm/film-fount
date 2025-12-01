import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_fount/features/search/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';

Widget relatedMoviesWidget(
  BuildContext context, {
  required ScrollController scrollController,
  required bool isLoadingMore,
  required String title,
  required String description,
  required List<MovieEntity> movieList,
  required bool hasMore,
}) {
  return movieList.isEmpty
      ? SizedBox.shrink()
      : Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 45),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.trackpad,
                  },
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.only(right: 25, left: 25),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...movieList.map<Widget>((movie) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                '/movie_details',
                                arguments: movie.id,
                              );
                            },
                            child: SizedBox(
                              height: 200,
                              width: 130,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                child: movie.posterPath != null
                                    ? CachedNetworkImage(
                                        imageUrl: movie.posterPath!,
                                        fit: BoxFit.cover,
                                        memCacheHeight: 400,
                                        placeholder: (context, url) =>
                                            Container(
                                              color: Color.fromRGBO(
                                                22,
                                                22,
                                                22,
                                                1,
                                              ),
                                            ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                              Icons.image_not_supported,
                                            ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                          color: Color.fromRGBO(22, 22, 22, 1),
                                        ),
                                        width: 100,
                                        height: 150,
                                        child: Icon(
                                          Icons.image_not_supported,
                                          color: Colors.grey,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        );
                      }),
                      isLoadingMore && hasMore
                          ? SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
}
