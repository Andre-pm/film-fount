import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:math' as math;

class AnimatedImageGridWidget extends StatelessWidget {
  final List<String> imageUrls;

  const AnimatedImageGridWidget({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    List<String> col1 = [];
    List<String> col2 = [];
    List<String> col3 = [];
    List<String> col4 = [];

    List<String> effectiveUrls = List.from(imageUrls);
    if (effectiveUrls.isNotEmpty && effectiveUrls.length < 4) {
      while (effectiveUrls.length < 4) {
        effectiveUrls.addAll(imageUrls);
      }
    }

    for (int i = 0; i < effectiveUrls.length; i++) {
      if (i % 4 == 0) {
        col1.add(effectiveUrls[i]);
      } else if (i % 4 == 1) {
        col2.add(effectiveUrls[i]);
      } else if (i % 4 == 2) {
        col3.add(effectiveUrls[i]);
      } else {
        col4.add(effectiveUrls[i]);
      }
    }

    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return ClipRect(
      child: Stack(
        children: [
          Container(
            color: theme.colorScheme.surface,
            child: OverflowBox(
              minWidth: size.width * 1.3,
              maxWidth: size.width * 1.3,
              minHeight: size.height * 1.2,
              maxHeight: size.height * 1.2,
              child: Transform.rotate(
                angle: 9.8 * math.pi / 180,
                child: Row(
                  children: [
                    Expanded(child: _buildColumn(col1, moveDown: true)),
                    const SizedBox(width: 8),

                    Expanded(child: _buildColumn(col2, moveDown: false)),
                    const SizedBox(width: 8),

                    Expanded(child: _buildColumn(col3, moveDown: true)),
                    const SizedBox(width: 8),

                    Expanded(child: _buildColumn(col4, moveDown: false)),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom:
                -1, // Extende 1px para baixo para cobrir qualquer buraco de renderização
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, theme.scaffoldBackgroundColor],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumn(List<String> urls, {required bool moveDown}) {
    if (urls.isEmpty) return const SizedBox.expand();
    return AutoScrollingColumn(imageUrls: urls, moveDown: moveDown);
  }
}

class AutoScrollingColumn extends StatefulWidget {
  final List<String> imageUrls;
  final bool moveDown;

  const AutoScrollingColumn({
    super.key,
    required this.imageUrls,
    required this.moveDown,
  });

  @override
  State<AutoScrollingColumn> createState() => _AutoScrollingColumnState();
}

class _AutoScrollingColumnState extends State<AutoScrollingColumn>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late Ticker _ticker;

  final double _scrollSpeed = 0.5;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _ticker = createTicker((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.offset + _scrollSpeed);
      }
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      physics: const NeverScrollableScrollPhysics(),
      reverse: widget.moveDown,
      itemBuilder: (context, index) {
        final imageUrl = widget.imageUrls[index % widget.imageUrls.length];
        final height = index % 2 == 0 ? 200.0 : 280.0;

        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              imageUrl,
              height: height,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: height,
                  color: Colors.grey[800],
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder: (context, error, stackTrace) => Container(
                height: height,
                color: Colors.grey[900],
                child: const Icon(Icons.broken_image, color: Colors.white54),
              ),
            ),
          ),
        );
      },
    );
  }
}
