import 'dart:convert';

import 'package:github_search/modules/search/domain/entities/result_search.dart';

/* princípio do abeto e fechado */
class ResultSearchModel extends ResultSearch {
  String image;
  String title;

  ResultSearchModel(this.image, this.title);

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    print(ResultSearchModel(
      map['avatar_url'],
      map['login'],
    ).toString());

    return ResultSearchModel(
      map['avatar_url'],
      map['login'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) => ResultSearchModel.fromMap(json.decode(source));

  @override
  String toString() => 'ResultSearchModel(image: $image, title: $title)';
}
