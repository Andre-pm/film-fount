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
  /// **'Você assistiu 3 filmes surrealistas da meta definida'**
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

  /// No description provided for @libraryAllSection.
  ///
  /// In pt, this message translates to:
  /// **'Todos os filmes'**
  String get libraryAllSection;

  /// No description provided for @libraryWatchedSection.
  ///
  /// In pt, this message translates to:
  /// **'Assistidos'**
  String get libraryWatchedSection;

  /// No description provided for @libraryNotWatchedSection.
  ///
  /// In pt, this message translates to:
  /// **'Não assistidos'**
  String get libraryNotWatchedSection;

  /// No description provided for @libraryWatchedSectionEmptyTitle.
  ///
  /// In pt, this message translates to:
  /// **'Parece que você ainda não assistiu nenhum filme da sua biblioteca pessoal'**
  String get libraryWatchedSectionEmptyTitle;

  /// No description provided for @libraryWatchedSectionEmptyDescription.
  ///
  /// In pt, this message translates to:
  /// **'basta clicar em adicionar a lista de Assistido na página de detalhes do filme'**
  String get libraryWatchedSectionEmptyDescription;

  /// No description provided for @libraryNotWatchedSectionEmptyTitle.
  ///
  /// In pt, this message translates to:
  /// **'Parece que você já assistiu todos os filmes da sua biblioteca pessoal'**
  String get libraryNotWatchedSectionEmptyTitle;

  /// No description provided for @libraryNotWatchedSectionEmptyDescription.
  ///
  /// In pt, this message translates to:
  /// **'aproveite para encontrar filmes relacionados aos que mais gostou na página de detalhes do filme'**
  String get libraryNotWatchedSectionEmptyDescription;

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

  /// No description provided for @movieDetailWatchedButton.
  ///
  /// In pt, this message translates to:
  /// **'Assistido'**
  String get movieDetailWatchedButton;

  /// No description provided for @movieDetailNotWatchedButton.
  ///
  /// In pt, this message translates to:
  /// **'Não assistido'**
  String get movieDetailNotWatchedButton;

  /// No description provided for @searchTitle.
  ///
  /// In pt, this message translates to:
  /// **'Pesquisa'**
  String get searchTitle;

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

  /// No description provided for @screenLoadError.
  ///
  /// In pt, this message translates to:
  /// **'Houve um erro ao carregar essa página!'**
  String get screenLoadError;

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

  /// No description provided for @movieDetailDescriptionNotFoundTitle.
  ///
  /// In pt, this message translates to:
  /// **'Não encontramos informações sobre esse filme'**
  String get movieDetailDescriptionNotFoundTitle;

  /// No description provided for @movieDetailDescriptionNotFoundDescription.
  ///
  /// In pt, this message translates to:
  /// **'Mas não se preocupe, clique aqui para pesquisar sobre {movieTitle} no Google'**
  String movieDetailDescriptionNotFoundDescription(String movieTitle);

  /// No description provided for @monthJanuary.
  ///
  /// In pt, this message translates to:
  /// **'janeiro'**
  String get monthJanuary;

  /// No description provided for @monthFebruary.
  ///
  /// In pt, this message translates to:
  /// **'fevereiro'**
  String get monthFebruary;

  /// No description provided for @monthMarch.
  ///
  /// In pt, this message translates to:
  /// **'março'**
  String get monthMarch;

  /// No description provided for @monthApril.
  ///
  /// In pt, this message translates to:
  /// **'abril'**
  String get monthApril;

  /// No description provided for @monthMay.
  ///
  /// In pt, this message translates to:
  /// **'maio'**
  String get monthMay;

  /// No description provided for @monthJune.
  ///
  /// In pt, this message translates to:
  /// **'junho'**
  String get monthJune;

  /// No description provided for @monthJuly.
  ///
  /// In pt, this message translates to:
  /// **'julho'**
  String get monthJuly;

  /// No description provided for @monthAugust.
  ///
  /// In pt, this message translates to:
  /// **'agosto'**
  String get monthAugust;

  /// No description provided for @monthSeptember.
  ///
  /// In pt, this message translates to:
  /// **'setembro'**
  String get monthSeptember;

  /// No description provided for @monthOctober.
  ///
  /// In pt, this message translates to:
  /// **'outubro'**
  String get monthOctober;

  /// No description provided for @monthNovember.
  ///
  /// In pt, this message translates to:
  /// **'novembro'**
  String get monthNovember;

  /// No description provided for @monthDecember.
  ///
  /// In pt, this message translates to:
  /// **'dezembro'**
  String get monthDecember;

  /// No description provided for @movieStatusProduction.
  ///
  /// In pt, this message translates to:
  /// **'Em produção'**
  String get movieStatusProduction;

  /// No description provided for @movieStatusReleased.
  ///
  /// In pt, this message translates to:
  /// **'Lançado'**
  String get movieStatusReleased;

  /// No description provided for @movieStatusUnknown.
  ///
  /// In pt, this message translates to:
  /// **'Lançamento não confirmado'**
  String get movieStatusUnknown;

  /// No description provided for @movieDetailRuntime.
  ///
  /// In pt, this message translates to:
  /// **'Duração {runtime}'**
  String movieDetailRuntime(String runtime);

  /// No description provided for @movieDetailRuntimeNotFound.
  ///
  /// In pt, this message translates to:
  /// **'Duração não definida'**
  String get movieDetailRuntimeNotFound;

  /// No description provided for @profileDeleteAccountButton.
  ///
  /// In pt, this message translates to:
  /// **'Excluir Conta'**
  String get profileDeleteAccountButton;

  /// No description provided for @profileDeleteDialogTitle.
  ///
  /// In pt, this message translates to:
  /// **'Confirmar Exclusão'**
  String get profileDeleteDialogTitle;

  /// No description provided for @profileDeleteDialogSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Sua biblioteca e preferências serão perdidas.'**
  String get profileDeleteDialogSubtitle;

  /// No description provided for @profileDeleteDialogDescription.
  ///
  /// In pt, this message translates to:
  /// **'Essa ação é irreversível. Tem certeza que deseja excluir sua conta?'**
  String get profileDeleteDialogDescription;

  /// No description provided for @profileDeleteDialogCancel.
  ///
  /// In pt, this message translates to:
  /// **'Cancelar'**
  String get profileDeleteDialogCancel;

  /// No description provided for @profileDeleteDialogConfirm.
  ///
  /// In pt, this message translates to:
  /// **'Confirmar'**
  String get profileDeleteDialogConfirm;

  /// No description provided for @accountDeletedAlert.
  ///
  /// In pt, this message translates to:
  /// **'Conta excluída com sucesso.'**
  String get accountDeletedAlert;

  /// No description provided for @warningPWABottomSheetTitle.
  ///
  /// In pt, this message translates to:
  /// **'Acesse a versão da plataforma como um app nativo'**
  String get warningPWABottomSheetTitle;

  /// No description provided for @warningPWABottomSheetFirstStep.
  ///
  /// In pt, this message translates to:
  /// **'1 - No seu navegador, toque em Compartilhar'**
  String get warningPWABottomSheetFirstStep;

  /// No description provided for @warningPWABottomSheetSecondStep.
  ///
  /// In pt, this message translates to:
  /// **'2 - Selecione Adicionar à Tela de Início'**
  String get warningPWABottomSheetSecondStep;

  /// No description provided for @warningPWABottomSheetFinalStep.
  ///
  /// In pt, this message translates to:
  /// **'Pronto, agora você pode acessar o app rapidamente pela tela inicial do seu celular!'**
  String get warningPWABottomSheetFinalStep;

  /// No description provided for @warningPWAWebTitle.
  ///
  /// In pt, this message translates to:
  /// **'📲 Acesse também pelo celular'**
  String get warningPWAWebTitle;

  /// No description provided for @warningPWAMobileTitle.
  ///
  /// In pt, this message translates to:
  /// **'📲 Adicione este app à sua tela inicial'**
  String get warningPWAMobileTitle;

  /// No description provided for @warningPWAMobileSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Você pode adicionar este app à tela inicial para acessar mais rápido e ter uma experiência ainda melhor'**
  String get warningPWAMobileSubtitle;

  /// No description provided for @warningPWAWebSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Acesse o site pelo seu celular e adicione este app à tela inicial para uma experiência ainda melhor'**
  String get warningPWAWebSubtitle;
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
