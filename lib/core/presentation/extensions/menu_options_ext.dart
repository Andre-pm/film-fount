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

  String get title {
    switch (this) {
      case MenuOptions.search:
        return 'Pesquisar';
      case MenuOptions.profile:
        return 'Perfil';
      case MenuOptions.library:
        return 'Biblioteca';
      case MenuOptions.goals:
        return 'Metas';
    }
  }
}
