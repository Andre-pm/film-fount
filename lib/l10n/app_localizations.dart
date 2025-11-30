import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('pt')];

  /// No description provided for @googleButton.
  ///
  /// In pt, this message translates to:
  /// **'Entrar com Google'**
  String get googleButton;

  /// No description provided for @whatIs.
  ///
  /// In pt, this message translates to:
  /// **'O que é FilmFount?'**
  String get whatIs;

  /// No description provided for @createYourLibrary.
  ///
  /// In pt, this message translates to:
  /// **'Crie sua biblioteca'**
  String get createYourLibrary;

  /// No description provided for @receiveRecommendations.
  ///
  /// In pt, this message translates to:
  /// **'Receba recomendações\ne decida que filme assistir'**
  String get receiveRecommendations;

  /// No description provided for @setGoals.
  ///
  /// In pt, this message translates to:
  /// **'Crie metas para assistir filmes'**
  String get setGoals;

  /// No description provided for @goalTitleExample.
  ///
  /// In pt, this message translates to:
  /// **'Você assistiu 3 filmes surrealistas esse mês'**
  String get goalTitleExample;

  /// No description provided for @goalSubtitleExample.
  ///
  /// In pt, this message translates to:
  /// **'3 semanas seguidas'**
  String get goalSubtitleExample;

  /// No description provided for @footerText.
  ///
  /// In pt, this message translates to:
  /// **'Desenvolvido por '**
  String get footerText;

  /// No description provided for @footerUser.
  ///
  /// In pt, this message translates to:
  /// **'@Andre-pm'**
  String get footerUser;

  /// No description provided for @footerException.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível abrir o site'**
  String get footerException;

  /// No description provided for @libraryTitle.
  ///
  /// In pt, this message translates to:
  /// **'Minha Biblioteca'**
  String get libraryTitle;

  /// No description provided for @librarySubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Sua lista de filmes para assistir'**
  String get librarySubtitle;

  /// No description provided for @libraryMovieIsWatched.
  ///
  /// In pt, this message translates to:
  /// **'Assistido'**
  String get libraryMovieIsWatched;

  /// No description provided for @libraryMovieIsNotWatched.
  ///
  /// In pt, this message translates to:
  /// **'Não assistido'**
  String get libraryMovieIsNotWatched;

  /// No description provided for @libraryEmptyTitle.
  ///
  /// In pt, this message translates to:
  /// **'Parece que a sua lista está vazia!'**
  String get libraryEmptyTitle;

  /// No description provided for @libraryEmptySubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Pesquise um filme e adicione a sua biblioteca para ele aparecer aqui.'**
  String get libraryEmptySubtitle;

  /// No description provided for @movieDetailRemoveLibrary.
  ///
  /// In pt, this message translates to:
  /// **'Remover da lista'**
  String get movieDetailRemoveLibrary;

  /// No description provided for @movieDetailAddLibrary.
  ///
  /// In pt, this message translates to:
  /// **'Adicionar a lista'**
  String get movieDetailAddLibrary;

  /// No description provided for @seachTitle.
  ///
  /// In pt, this message translates to:
  /// **'Pesquisa'**
  String get seachTitle;

  /// No description provided for @searchSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Encontre informações sobre seus filmes que você deseja assistir'**
  String get searchSubtitle;

  /// No description provided for @searchMovieTitle.
  ///
  /// In pt, this message translates to:
  /// **'Nome do filme'**
  String get searchMovieTitle;

  /// No description provided for @searchMovieButton.
  ///
  /// In pt, this message translates to:
  /// **'Pesquisar filme'**
  String get searchMovieButton;

  /// No description provided for @searchMovieEmptyTitle.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum filme encontrado.'**
  String get searchMovieEmptyTitle;

  /// No description provided for @searchMovieTitleNotFound.
  ///
  /// In pt, this message translates to:
  /// **'Título não disponível'**
  String get searchMovieTitleNotFound;

  /// No description provided for @searchMovieDescriptionNotFound.
  ///
  /// In pt, this message translates to:
  /// **'Sem descrição disponível.'**
  String get searchMovieDescriptionNotFound;

  /// No description provided for @searchMovieError.
  ///
  /// In pt, this message translates to:
  /// **'Houve um erro ao carregar essa página!'**
  String get searchMovieError;

  /// No description provided for @menuOptionSearch.
  ///
  /// In pt, this message translates to:
  /// **'Pesquisar'**
  String get menuOptionSearch;

  /// No description provided for @menuOptionProfile.
  ///
  /// In pt, this message translates to:
  /// **'Perfil'**
  String get menuOptionProfile;

  /// No description provided for @menuOptionAccessProfile.
  ///
  /// In pt, this message translates to:
  /// **'Acessar perfil'**
  String get menuOptionAccessProfile;

  /// No description provided for @menuOptionLibrary.
  ///
  /// In pt, this message translates to:
  /// **'Biblioteca'**
  String get menuOptionLibrary;

  /// No description provided for @menuOptionGoals.
  ///
  /// In pt, this message translates to:
  /// **'Metas'**
  String get menuOptionGoals;

  /// No description provided for @menuOptionLogout.
  ///
  /// In pt, this message translates to:
  /// **'Sair'**
  String get menuOptionLogout;

  /// No description provided for @underDevelopmentTitle.
  ///
  /// In pt, this message translates to:
  /// **'A funcionalidade de {selectedOption} está em desenvolvimento'**
  String underDevelopmentTitle(String selectedOption);

  /// No description provided for @underDevelopmentSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Assim que ela estiver pronta, você será avisado!'**
  String get underDevelopmentSubtitle;

  /// No description provided for @movieDetailSimilarMovieTitle.
  ///
  /// In pt, this message translates to:
  /// **'Filmes similares'**
  String get movieDetailSimilarMovieTitle;

  /// No description provided for @movieDetailSimilarMovieDescription.
  ///
  /// In pt, this message translates to:
  /// **'que possuem caracteristicas similares ao filme, seja gênero, palavras-chave...'**
  String get movieDetailSimilarMovieDescription;

  /// No description provided for @movieDetailRecommendationsTitle.
  ///
  /// In pt, this message translates to:
  /// **'Filmes Recomendados'**
  String get movieDetailRecommendationsTitle;

  /// No description provided for @movieDetailRecommendationsDescription.
  ///
  /// In pt, this message translates to:
  /// **'que são populares com usuários que assistiram esse filme'**
  String get movieDetailRecommendationsDescription;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
