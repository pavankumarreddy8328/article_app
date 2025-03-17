import 'dart:convert';

Article articleResponseFromJson(String str) {
  final Map<String, dynamic> jsonData = json.decode(str);
  return Article.fromJson(jsonData["data"]);
}


class Article {
  final String id;
  final String title;
  final String author;
  final String category;
  final String description;
  final int readTime;
  final String createdAt;
  final String updatedAt;
   final String? errorMessage; // Optional error field
  Article({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.description,
    required this.readTime,
    required this.createdAt,
    required this.updatedAt,
     this.errorMessage, // Error field
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    try {
      return Article(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        author: json['author'] ?? '',
        category: json['category'] ?? '',
        description: json['description'] ?? '',
        readTime: json['read_time'] ?? 0,
        createdAt: json['createdAt'] ?? '',
        updatedAt: json['updatedAt'] ?? '',
      );
    } catch (e) {
      return Article.error(e.toString());
    }
  }

  // Error Constructor
  factory Article.error(String message) {
    return Article(
      id: '',
      title: '',
      author: '',
      category: '',
      description: '',
      readTime: 0,
      createdAt: '',
      updatedAt: '',
      errorMessage: message,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'category': category,
      'description': description,
      'read_time': readTime,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
