// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get googleButton => 'Entrar com Google';

  @override
  String get whatIs => 'O que é FilmFount?';

  @override
  String get createYourLibrary => 'Crie sua biblioteca';

  @override
  String get receiveRecommendations =>
      'Receba recomendações\ne decida que filme assistir';

  @override
  String get setGoals => 'Crie metas para assistir filmes';

  @override
  String get goalTitleExample => 'Você assistiu 3 filmes surrealistas esse mês';

  @override
  String get goalSubtitleExample => '3 semanas seguidas';

  @override
  String get footerText => 'Desenvolvido por ';

  @override
  String get footerUser => '@Andre-pm';

  @override
  String get footerException => 'Não foi possível abrir o site';

  @override
  String get libraryTitle => 'Minha Biblioteca';

  @override
  String get librarySubtitle => 'Sua lista de filmes para assistir';

  @override
  String get libraryMovieIsWatched => 'Assistido';

  @override
  String get libraryMovieIsNotWatched => 'Não assistido';

  @override
  String get libraryEmptyTitle => 'Parece que a sua lista está vazia!';

  @override
  String get libraryEmptySubtitle =>
      'Pesquise um filme e adicione a sua biblioteca para ele aparecer aqui.';

  @override
  String get movieDetailRemoveLibrary => 'Remover da lista';

  @override
  String get movieDetailAddLibrary => 'Adicionar a lista';

  @override
  String get searchTitle => 'Pesquisa';

  @override
  String get searchSubtitle =>
      'Encontre informações sobre seus filmes que você deseja assistir';

  @override
  String get searchMovieTitle => 'Nome do filme';

  @override
  String get searchMovieButton => 'Pesquisar filme';

  @override
  String get searchMovieEmptyTitle => 'Nenhum filme encontrado.';

  @override
  String get searchMovieTitleNotFound => 'Título não disponível';

  @override
  String get searchMovieDescriptionNotFound => 'Sem descrição disponível.';

  @override
  String get searchMovieError => 'Houve um erro ao carregar essa página!';

  @override
  String get menuOptionSearch => 'Pesquisar';

  @override
  String get menuOptionProfile => 'Perfil';

  @override
  String get menuOptionAccessProfile => 'Acessar perfil';

  @override
  String get menuOptionLibrary => 'Biblioteca';

  @override
  String get menuOptionGoals => 'Metas';

  @override
  String get menuOptionLogout => 'Sair';

  @override
  String underDevelopmentTitle(String selectedOption) {
    return 'A funcionalidade de $selectedOption está em desenvolvimento';
  }

  @override
  String get underDevelopmentSubtitle =>
      'Assim que ela estiver pronta, você será avisado!';

  @override
  String get movieDetailSimilarMovieTitle => 'Filmes similares';

  @override
  String get movieDetailSimilarMovieDescription =>
      'que possuem caracteristicas similares ao filme, seja gênero, palavras-chave...';

  @override
  String get movieDetailRecommendationsTitle => 'Filmes Recomendados';

  @override
  String get movieDetailRecommendationsDescription =>
      'que são populares com usuários que assistiram esse filme';

  @override
  String get movieDetailDescriptionNotFoundTitle =>
      'Não encontramos informações sobre esse filme';

  @override
  String movieDetailDescriptionNotFoundDescription(String movieTitle) {
    return 'Mas não se preocupe, clique aqui para pesquisar sobre $movieTitle no Google';
  }
}
