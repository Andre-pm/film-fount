import 'package:flutter/material.dart';

class MovieGrid extends StatelessWidget {
  final bool isLargeScreen;
  final double screenWidth;
  final double screenPercentage;
  final int itemCount;
  final int crossAxisCount;
  final String asset;

  const MovieGrid({
    super.key,
    required this.isLargeScreen,
    required this.screenWidth,
    required this.screenPercentage,
    required this.itemCount,
    required this.crossAxisCount,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isLargeScreen ? 100 : 25),
      child: SizedBox(
        width: isLargeScreen ? screenWidth * screenPercentage : screenWidth,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 165 / 245.5,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: Image.asset('${asset}_$index.png').image,
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
