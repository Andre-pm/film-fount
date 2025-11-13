// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieSearchResponseImpl _$$MovieSearchResponseImplFromJson(
  Map<String, dynamic> json,
) => _$MovieSearchResponseImpl(
  results: (json['results'] as List<dynamic>)
      .map((e) => MovieItemResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$MovieSearchResponseImplToJson(
  _$MovieSearchResponseImpl instance,
) => <String, dynamic>{'results': instance.results};

_$MovieItemResponseImpl _$$MovieItemResponseImplFromJson(
  Map<String, dynamic> json,
) => _$MovieItemResponseImpl(
  id: (json['id'] as num).toInt(),
  original_language: json['original_language'] as String?,
  original_title: json['original_title'] as String?,
  overview: json['overview'] as String?,
  poster_path: json['poster_path'] as String?,
  title: json['title'] as String?,
);

Map<String, dynamic> _$$MovieItemResponseImplToJson(
  _$MovieItemResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'original_language': instance.original_language,
  'original_title': instance.original_title,
  'overview': instance.overview,
  'poster_path': instance.poster_path,
  'title': instance.title,
};
