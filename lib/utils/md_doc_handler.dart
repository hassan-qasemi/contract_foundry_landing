import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';

Future<MDDocModel?> loadMDDoc(String path) async {
  try {
    return MDDocModel.fromJson(await rootBundle.loadString(path));
  } catch (err) {
    log('init faq error : ${err.toString()}');
  }
}

class MDDocModel {
  final String content;
  MDDocModel({required this.content});

  MDDocModel copyWith({String? content}) {
    return MDDocModel(content: content ?? this.content);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'content': content});

    return result;
  }

  factory MDDocModel.fromMap(Map<String, dynamic> map) {
    return MDDocModel(content: map['content'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory MDDocModel.fromJson(String source) =>
      MDDocModel.fromMap(json.decode(source));
}
