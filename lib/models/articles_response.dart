import 'dart:convert';

import 'package:article_app/models/article_model.dart';

ArticlesResponse allArticlesResponseFromJson(String str) {
  final Map<String, dynamic> jsonData = json.decode(str);
  return ArticlesResponse.fromJson(jsonData);
}

class ArticlesResponse {
  final bool success;
  final int statusCode;
  final Data data;
  final String message;

  ArticlesResponse({
    required this.success,
    required this.statusCode,
    required this.data,
    required this.message,
  });

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) {
    return ArticlesResponse(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      data: Data.fromJson(json['data'] ?? {}),
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'statusCode': statusCode,
      'data': data.toJson(),
      'message': message,
    };
  }
}

class Data {
  final int totalRecords;
  final int currentPage;
  final int lastPage;
  final List<Article> records;
  final int count;

  Data({
    required this.totalRecords,
    required this.currentPage,
    required this.lastPage,
    required this.records,
    required this.count,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      totalRecords: json['total_records'] ?? 0,
      currentPage: json['current_page'] ?? 0,
      lastPage: json['last_page'] ?? 0,
      records: (json['records'] as List<dynamic>?)?.map((e) => Article.fromJson(e)).toList() ?? [],
      count: json['count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_records': totalRecords,
      'current_page': currentPage,
      'last_page': lastPage,
      'records': records.map((e) => e.toJson()).toList(),
      'count': count,
    };
  }
}

