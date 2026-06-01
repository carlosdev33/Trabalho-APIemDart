import 'dart:convert';

class TypiCode {
  final int userId;
  final int id;
  final String title;
  final String body;
  TypiCode({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory TypiCode.fromMap(Map<String, dynamic> map) {
    return TypiCode(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TypiCode.fromJson(String source) =>
      TypiCode.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TypiCode(userId: $userId, id: $id, title: $title, body: $body)';
  }
}