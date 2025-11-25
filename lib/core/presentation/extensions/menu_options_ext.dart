import 'package:film_fount/core/domain/enums/menu_option.dart';

extension MenuOptionsExt on MenuOptions {
  String get route {
    switch (this) {
      case MenuOptions.search:
        return '/search';
      case MenuOptions.profile:
        return '/profile';
      case MenuOptions.library:
        return '/library';
      case MenuOptions.goals:
        return '/goals';
    }
  }
}
