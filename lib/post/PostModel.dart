import 'dart:convert';

class Post {
  // Variaveis
  String title;
  String content;

  // Construtor
  Post({
    required this.title,
    required this.content,
  });

  // Conversões
  factory Post.fromJson(Map<String, dynamic> json) => Post(
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
      };
}
