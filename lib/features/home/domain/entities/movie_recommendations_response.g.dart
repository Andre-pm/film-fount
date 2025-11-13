// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_recommendations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieRecommendationsResponseImpl _$$MovieRecommendationsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$MovieRecommendationsResponseImpl(
  page: (json['page'] as num).toInt(),
  total_pages: (json['total_pages'] as num).toInt(),
  total_results: (json['total_results'] as num).toInt(),
  results: (json['results'] as List<dynamic>)
      .map((e) => RecommendationsResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$MovieRecommendationsResponseImplToJson(
  _$MovieRecommendationsResponseImpl instance,
) => <String, dynamic>{
  'page': instance.page,
  'total_pages': instance.total_pages,
  'total_results': instance.total_results,
  'results': instance.results,
};

_$RecommendationsResponseImpl _$$RecommendationsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RecommendationsResponseImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String?,
  original_title: json['original_title'] as String?,
  poster_path: json['poster_path'] as String?,
  overview: json['overview'] as String?,
);

Map<String, dynamic> _$$RecommendationsResponseImplToJson(
  _$RecommendationsResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'original_title': instance.original_title,
  'poster_path': instance.poster_path,
  'overview': instance.overview,
};
