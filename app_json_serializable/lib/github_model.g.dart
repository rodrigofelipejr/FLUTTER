// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Github _$GithubFromJson(Map<String, dynamic> json) {
  return Github(
    json['login'] as String,
    json['id'] as int,
    json['nodeId'] as String,
    json['avatarUrl'] as String,
    json['avatarUrl'] as String?,
    json['url'] as String,
    json['htmlUrl'] as String,
    json['followersUrl'] as String,
    json['followingUrl'] as String,
    json['gistsUrl'] as String,
    json['starredUrl'] as String,
    json['subscriptionsUrl'] as String,
    json['organizationsUrl'] as String,
    json['reposUrl'] as String,
    json['eventsUrl'] as String,
    json['receivedEventsUrl'] as String,
    json['type'] as String,
    json['siteAdmin'] as bool,
    json['score'] as int,
  );
}

Map<String, dynamic> _$GithubToJson(Github instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'nodeId': instance.nodeId,
      'avatarUrl': instance.avatarUrl,
      'avatarUrl': instance.avatarUrl,
      'url': instance.url,
      'htmlUrl': instance.htmlUrl,
      'followersUrl': instance.followersUrl,
      'followingUrl': instance.followingUrl,
      'gistsUrl': instance.gistsUrl,
      'starredUrl': instance.starredUrl,
      'subscriptionsUrl': instance.subscriptionsUrl,
      'organizationsUrl': instance.organizationsUrl,
      'reposUrl': instance.reposUrl,
      'eventsUrl': instance.eventsUrl,
      'receivedEventsUrl': instance.receivedEventsUrl,
      'type': instance.type,
      'siteAdmin': instance.siteAdmin,
      'score': instance.score,
    };
