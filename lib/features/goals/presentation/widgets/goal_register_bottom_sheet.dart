import 'package:film_fount/core/presentation/extensions/string_extensions.dart';
import 'package:film_fount/features/search/domain/entities/movie_entity.dart';
import 'package:film_fount/features/search/presentation/providers/search_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoalRegisterBottomSheet extends ConsumerStatefulWidget {
  const GoalRegisterBottomSheet({super.key});

  @override
  ConsumerState<GoalRegisterBottomSheet> createState() =>
      _GoalRegisterBottomSheetState();
}

class _GoalRegisterBottomSheetState
    extends ConsumerState<GoalRegisterBottomSheet> {
  final List<MovieEntity> _selectedMovies = [];
  final List<int> _selectedMovieIds = [];
  late TextEditingController _movieNamecontroller;
  late TextEditingController _goalNameController;
  late ScrollController _scrollController;
  bool _isLoadingNextPage = false;

  @override
  void initState() {
    super.initState();
    _goalNameController = TextEditingController();
    _movieNamecontroller = TextEditingController();
    _movieNamecontroller.addListener(() {
      setState(() {});
    });
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  Future<void> _onScroll() async {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!_isLoadingNextPage) {
        final notifier = ref.read(movieSearchNotifierProvider.notifier);
        if (notifier.isMoreMovies) {
          _isLoadingNextPage = true;
          await notifier.loadSearchNextPage();
          _isLoadingNextPage = false;
        }
      }
    }
  }

  @override
  void dispose() {
    _goalNameController.dispose();
    _movieNamecontroller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(movieSearchNotifierProvider);
    final notifier = ref.read(movieSearchNotifierProvider.notifier);

    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Color.fromRGBO(22, 22, 22, 1),
      ),
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 30,
                    bottom: 15,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Qual o nome da sua meta?',
                          style: TextStyle(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: _goalNameController,
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            fillColor: Color.fromRGBO(217, 217, 217, 0.7),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'Ex: 10 filmes até o final do ano',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 10,
                    bottom: 15,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _movieNamecontroller,
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              fillColor: Color.fromRGBO(217, 217, 217, 0.7),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                              ),
                              hintText: 'Nome do filme',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                              ),
                            ),
                            onSubmitted: (query) {
                              notifier.searchMovie(query);
                            },
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            notifier.searchMovie(_movieNamecontroller.text);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _movieNamecontroller.text.isNotEmpty
                                  ? theme.colorScheme.secondary
                                  : theme.colorScheme.onSurface.withValues(
                                      alpha: 0.5,
                                    ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            height: 47,
                            width: 45,
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.search,
                              color: theme.colorScheme.tertiary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_selectedMovies.isNotEmpty)
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _StickySelectedMoviesDelegate(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Filmes selecionados'),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: theme.colorScheme.primary,
                            ),
                            height: 95,
                            width: double.infinity,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: _selectedMovies.map((movie) {
                                  return Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0,
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          child: movie.posterPath != null
                                              ? Image.network(
                                                  movie.posterPath.orEmpty,
                                                  width: 50,
                                                  height: 75,
                                                  fit: BoxFit.cover,
                                                )
                                              : Container(
                                                  width: 50,
                                                  height: 75,
                                                  color: Colors.grey,
                                                  child: Column(
                                                    children: [
                                                      Icon(
                                                        Icons.movie,
                                                        color: Colors.white,
                                                      ),
                                                      Spacer(),
                                                      Text(
                                                        movie.title.orEmpty,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: theme
                                                              .colorScheme
                                                              .onPrimary,
                                                        ),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -15,
                                        right: -10,
                                        child: IconButton(
                                          iconSize: 15,
                                          onPressed: () {
                                            setState(() {
                                              _selectedMovies.removeWhere(
                                                (m) => m.id == movie.id,
                                              );
                                              _selectedMovieIds.remove(
                                                movie.id,
                                              );
                                            });
                                          },
                                          icon: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                SliverPadding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 15,
                    bottom: 20,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: state.when(
                      initial: () => SizedBox.shrink(),
                      loading: () => Center(
                        child: CircularProgressIndicator(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                      data: (data) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final movie = data[index];
                            return InkWell(
                              onTap: () => Navigator.of(context).pushNamed(
                                '/movie_details',
                                arguments: movie.id,
                              ),
                              child: ListTile(
                                leading: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: movie.posterPath != null
                                      ? Image.network(
                                          movie.posterPath.orEmpty,
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        )
                                      : Icon(Icons.movie, size: 50),
                                ),
                                title: Text(movie.title.orEmpty),
                                subtitle: Text(
                                  movie.releaseDate != null &&
                                          movie.releaseDate!.length >= 4
                                      ? movie.releaseDate!.substring(0, 4)
                                      : movie.releaseDate.orEmpty,
                                ),
                                trailing: IconButton(
                                  icon: Icon(
                                    _selectedMovieIds.contains(movie.id)
                                        ? Icons.check
                                        : Icons.add,
                                    color: _selectedMovieIds.contains(movie.id)
                                        ? Colors.green
                                        : null,
                                  ),
                                  onPressed: () {
                                    if (!_selectedMovieIds.contains(movie.id)) {
                                      setState(() {
                                        _selectedMovies.add(movie);
                                        _selectedMovieIds.add(movie.id);
                                        _movieNamecontroller.clear();
                                      });
                                    } else {
                                      setState(() {
                                        _selectedMovies.removeWhere(
                                          (m) => m.id == movie.id,
                                        );
                                        _selectedMovieIds.remove(movie.id);
                                      });
                                    }
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                      error: (e) {
                        return Text(e.toString());
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_selectedMovies.isNotEmpty && _goalNameController.text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 25,
                top: 10,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      '/goal_detail',
                      arguments: {
                        'goalName': _goalNameController.text,
                        'selectedMovies': _selectedMovies,
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: theme.colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Definir data',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _StickySelectedMoviesDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickySelectedMoviesDelegate({required this.child});

  @override
  double get minExtent => 135.0;

  @override
  double get maxExtent => 135.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Color.fromRGBO(22, 22, 22, 1),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      alignment: Alignment.centerLeft,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant _StickySelectedMoviesDelegate oldDelegate) {
    return true;
  }
}
