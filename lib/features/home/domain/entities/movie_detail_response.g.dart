// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieDetailResponseImpl _$$MovieDetailResponseImplFromJson(
  Map<String, dynamic> json,
) => _$MovieDetailResponseImpl(
  backdrop_path: json['backdrop_path'] as String?,
  origin_country: json['origin_country'] as String?,
  original_language: json['original_language'] as String?,
  original_title: json['original_title'] as String?,
  overview: json['overview'] as String?,
  release_date: json['release_date'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$$MovieDetailResponseImplToJson(
  _$MovieDetailResponseImpl instance,
) => <String, dynamic>{
  'backdrop_path': instance.backdrop_path,
  'origin_country': instance.origin_country,
  'original_language': instance.original_language,
  'original_title': instance.original_title,
  'overview': instance.overview,
  'release_date': instance.release_date,
  'status': instance.status,
};
