import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget goalSquareWidget(
  String path, {
  bool? isWatched,
  BoxFit fit = BoxFit.cover,
  Widget? fallback,
  double? width,
  double? height,
  BorderRadius? borderRadius,
}) {
  return FutureBuilder<bool>(
    future: assetExists(path),
    builder: (context, snapshot) {
      final assetExists = snapshot.data ?? false;
      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: assetExists
            ? Image.asset(path, width: width, height: height, fit: fit)
            : Container(
                color: isWatched == true
                    ? const Color.fromRGBO(183, 144, 109, 1)
                    : Color.fromRGBO(241, 240, 236, 1),
              ),
      );
    },
  );
}

Future<bool> assetExists(String assetPath) async {
  final manifestContent = await rootBundle.loadString('AssetManifest.json');
  final Map<String, dynamic> manifestMap = json.decode(manifestContent);

  return manifestMap.containsKey(assetPath);
}
