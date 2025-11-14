import 'package:film_fount/features/home/movie_search_notifier%20copy.dart';
import 'package:film_fount/features/home/presentation/layout/menu_large_version.dart';
import 'package:film_fount/features/home/presentation/layout/menu_small_version.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieController = TextEditingController();
    final state = ref.watch(movieSearchNotifierProvider);
    final notifier = ref.read(movieSearchNotifierProvider.notifier);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isLargeVersion = constraints.maxWidth > 1200;

          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                titleSpacing: 100,
                leadingWidth: 100,
                floating: true,
                leading: Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: SvgPicture.asset(
                    'assets/svg/logo_navbar_horizontal.svg',
                  ),
                ),
                backgroundColor: Color.fromRGBO(241, 240, 236, 1),
                actions: [
                  isLargeVersion ? MenuLargeVersion() : MenuSmallVersion(),
                ],
                actionsPadding: EdgeInsets.symmetric(horizontal: 24),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 40,
                  ),
                  child: TextFormField(
                    controller: movieController,
                    decoration: InputDecoration(
                      labelText: 'Nome do filme',
                      filled: true,
                      fillColor: Color.fromRGBO(241, 240, 236, 1),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextButton(
                    style: ButtonStyle(
                      textStyle: WidgetStateProperty.all<TextStyle>(
                        TextStyle(fontWeight: FontWeight.w600),
                      ),
                      backgroundColor: WidgetStateProperty.all<Color>(
                        const Color.fromRGBO(151, 109, 71, 1),
                      ),
                      foregroundColor: WidgetStateProperty.all<Color>(
                        Color.fromRGBO(31, 31, 31, 1),
                      ),
                    ),
                    onPressed: () => notifier.searchMovie(movieController.text),
                    child: Text(
                      'Pesquisar Filme',
                      style: TextStyle(color: Color.fromRGBO(241, 240, 236, 1)),
                    ),
                  ),
                ),
              ),

              state.when(
                initial: () =>
                    const SliverToBoxAdapter(child: SizedBox.shrink()),
                loading: () => const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                ),
                data: (data) {
                  if (data.results.isEmpty) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'Nenhum filme encontrado.',
                          style: TextStyle(
                            color: Color.fromRGBO(241, 240, 236, 1),
                          ),
                        ),
                      ),
                    );
                  }
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final movie = data.results[index];
                      final imageUrl = movie.poster_path != null
                          ? 'https://image.tmdb.org/t/p/w500${movie.poster_path}'
                          : null;

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed(
                            '/movie_details',
                            arguments: movie.id,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 8,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(31, 31, 31, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (imageUrl != null)
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                    child: Image.network(
                                      imageUrl,
                                      width: 100,
                                      height: 150,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => const Icon(
                                        Icons.broken_image,
                                        size: 100,
                                        color: Colors.grey,
                                      ),
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

                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          movie.title ??
                                              'Título não disponível',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(
                                              241,
                                              240,
                                              236,
                                              1,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          movie.overview?.isNotEmpty == true
                                              ? movie.overview!
                                              : 'Sem descrição disponível.',
                                          style: const TextStyle(
                                            color: Color.fromRGBO(
                                              200,
                                              200,
                                              200,
                                              1,
                                            ),
                                          ),
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
                    }, childCount: data.results.length),
                  );
                },
                error: (error) => SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      'Erro: $error',
                      style: TextStyle(color: Color.fromRGBO(241, 240, 236, 1)),
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
