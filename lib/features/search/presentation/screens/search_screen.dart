import 'package:film_fount/core/domain/enums/menu_option.dart';
import 'package:film_fount/core/presentation/widgets/menu_bar_widget.dart';
import 'package:film_fount/features/search/presentation/providers/search_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final movieController = TextEditingController();
    final state = ref.watch(movieSearchNotifierProvider);
    final notifier = ref.read(movieSearchNotifierProvider.notifier);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isLargeVersion = constraints.maxWidth > 1200;

          return CustomScrollView(
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
                        'Pesquisa',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(241, 240, 236, 1),
                        ),
                      ),
                      Text(
                        'Encontre informações sobre seus filmes que você deseja assistir',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(241, 240, 236, 1),
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
                    controller: movieController,
                    style: TextStyle(color: Color.fromRGBO(30, 30, 30, 1)),
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
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                data: (data) {
                  if (data.isEmpty) {
                    return const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Center(
                          child: Text(
                            'Nenhum filme encontrado.',
                            style: TextStyle(
                              color: Color.fromRGBO(241, 240, 236, 1),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final movie = data[index];

                      return Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: GestureDetector(
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
                                color: const Color.fromRGBO(31, 31, 31, 1),
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
                                        errorBuilder: (_, __, ___) =>
                                            const Icon(
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
                        ),
                      );
                    }, childCount: data.length),
                  );
                },
                error: (error) => SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      'Houve um erro ao carregar essa página: \n$error',
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
