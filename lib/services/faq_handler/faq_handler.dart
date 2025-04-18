import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';

class FaqHandler {
  static FAQModel? _state;

  static FAQModel? get state => _state;

  static Future<void> initFAQHandler() async {
    try {
      _state = FAQModel.fromJson(await rootBundle.loadString('assets/faq_md'));
    } catch (err) {
      log('init faq error : ${err.toString()}');
    }
  }
}

class FAQModel {
  final String content;
  FAQModel({required this.content});

  FAQModel copyWith({String? content}) {
    return FAQModel(content: content ?? this.content);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'content': content});

    return result;
  }

  factory FAQModel.fromMap(Map<String, dynamic> map) {
    return FAQModel(content: map['content'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory FAQModel.fromJson(String source) =>
      FAQModel.fromMap(json.decode(source));

  @override
  String toString() => 'FAQModel(content: $content)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FAQModel && other.content == content;
  }

  @override
  int get hashCode => content.hashCode;
}
