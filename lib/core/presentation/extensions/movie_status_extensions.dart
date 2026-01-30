import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';
import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

extension MovieStatusExtensions on MovieStatus {
  String getName(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    switch (this) {
      case MovieStatus.production:
        return strings.movieStatusProduction;
      case MovieStatus.released:
        return strings.movieStatusReleased;
      case MovieStatus.unknown:
        return strings.movieStatusUnknown;
    }
  }
}
