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
  String get libraryAllSection => 'Todos os filmes';

  @override
  String get libraryWatchedSection => 'Assistidos';

  @override
  String get libraryNotWatchedSection => 'Não assistidos';

  @override
  String get libraryWatchedSectionEmptyTitle =>
      'Parece que você ainda não assistiu nenhum filme da sua biblioteca pessoal';

  @override
  String get libraryWatchedSectionEmptyDescription =>
      'basta clicar em adicionar a lista de Assistido na página de detalhes do filme';

  @override
  String get libraryNotWatchedSectionEmptyTitle =>
      'Parece que você já assistiu todos os filmes da sua biblioteca pessoal';

  @override
  String get libraryNotWatchedSectionEmptyDescription =>
      'aproveite para encontrar filmes relacionados aos que mais gostou na página de detalhes do filme';

  @override
  String get movieDetailRemoveLibrary => 'Remover da lista';

  @override
  String get movieDetailAddLibrary => 'Adicionar a lista';

  @override
  String get movieDetailWatchedButton => 'Assistido';

  @override
  String get movieDetailNotWatchedButton => 'Não assistido';

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
  String get screenLoadError => 'Houve um erro ao carregar essa página!';

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

  @override
  String get monthJanuary => 'janeiro';

  @override
  String get monthFebruary => 'fevereiro';

  @override
  String get monthMarch => 'março';

  @override
  String get monthApril => 'abril';

  @override
  String get monthMay => 'maio';

  @override
  String get monthJune => 'junho';

  @override
  String get monthJuly => 'julho';

  @override
  String get monthAugust => 'agosto';

  @override
  String get monthSeptember => 'setembro';

  @override
  String get monthOctober => 'outubro';

  @override
  String get monthNovember => 'novembro';

  @override
  String get monthDecember => 'dezembro';

  @override
  String get movieStatusProduction => 'Em produção';

  @override
  String get movieStatusReleased => 'Lançado';

  @override
  String get movieStatusUnknown => 'Lançamento não confirmado';

  @override
  String movieDetailRuntime(String runtime) {
    return 'Duração $runtime';
  }

  @override
  String get movieDetailRuntimeNotFound => 'Duração não definida';

  @override
  String get profileDeleteAccountButton => 'Excluir Conta';

  @override
  String get profileDeleteDialogTitle => 'Confirmar Exclusão';

  @override
  String get profileDeleteDialogSubtitle =>
      'Sua biblioteca e preferências serão perdidas.';

  @override
  String get profileDeleteDialogDescription =>
      'Essa ação é irreversível. Tem certeza que deseja excluir sua conta?';

  @override
  String get profileDeleteDialogCancel => 'Cancelar';

  @override
  String get profileDeleteDialogConfirm => 'Confirmar';

  @override
  String get accountDeletedAlert => 'Conta excluída com sucesso.';

  @override
  String get warningPWABottomSheetTitle =>
      'Acesse a versão da plataforma como um app nativo';

  @override
  String get warningPWABottomSheetFirstStep =>
      '1 - No seu navegador, toque em Compartilhar';

  @override
  String get warningPWABottomSheetSecondStep =>
      '2 - Selecione Adicionar à Tela de Início';

  @override
  String get warningPWABottomSheetFinalStep =>
      'Pronto, agora você pode acessar o app rapidamente pela tela inicial do seu celular!';

  @override
  String get warningPWAWebTitle => '📲 Acesse também pelo celular';

  @override
  String get warningPWAMobileTitle => '📲 Adicione este app à sua tela inicial';

  @override
  String get warningPWAMobileSubtitle =>
      'Você pode adicionar este app à tela inicial para acessar mais rápido e ter uma experiência ainda melhor';

  @override
  String get warningPWAWebSubtitle =>
      'Acesse o site pelo seu celular e adicione este app à tela inicial para uma experiência ainda melhor';
}
