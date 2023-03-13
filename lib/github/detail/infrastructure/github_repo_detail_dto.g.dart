// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repo_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GithubRepoDetailDTO _$$_GithubRepoDetailDTOFromJson(
        Map<String, dynamic> json) =>
    _$_GithubRepoDetailDTO(
      fullName: json['fullName'] as String,
      html: json['html'] as String,
      starred: json['starred'] as bool,
    );

Map<String, dynamic> _$$_GithubRepoDetailDTOToJson(
        _$_GithubRepoDetailDTO instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'html': instance.html,
      'starred': instance.starred,
    };
