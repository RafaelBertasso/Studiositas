class PostModel {
  final int? id;
  final String userName;
  final String imageUrl;
  final String duration;
  final String description;
  final DateTime createdAt;

  PostModel({
    this.id,
    required this.userName,
    required this.imageUrl,
    required this.duration,
    required this.description,
    required this.createdAt,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userName: json['userName'],
      imageUrl: json['imageUrl'],
      duration: json['duration'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userName": userName,
      "imageUrl": imageUrl,
      "duration": duration,
      "description": description,
      "createdAt": createdAt.toIso8601String(),
    };
  }
}
