class RetseptModel {
  final String id;
  final String name;
  final String category;
  final String dietaryTarget;
  final String difficulty;
  final String preparationTime;
  final String description;
  final String preparer;
  final double rate;
  final int likes;
  final String image;
  final String video;

  RetseptModel({
    required this.id,
    required this.name,
    required this.category,
    required this.dietaryTarget,
    required this.difficulty,
    required this.preparationTime,
    required this.description,
    required this.preparer,
    required this.rate,
    required this.likes,
    required this.image,
    required this.video,
  });

  // Factory constructor to create an instance from a JSON map
  factory RetseptModel.fromJson(Map<String, dynamic> json) {
    return RetseptModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      category: json['category'] ?? '',
      dietaryTarget: json['dietaryTarget'] ?? '',
      difficulty: json['difficulty'] ?? '',
      preparationTime: json['preparationTime'] ?? '',
      description: json['description'] ?? '',
      preparer: json['preparer'] ?? '',
      rate: json['rate'] as double? ?? 0,
      likes: json['likes'] as int? ?? 0,
      image: json['image'] ?? '',
      video: json['video'] ?? '',
    );
  }

  // Method to convert an instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'dietaryTarget': dietaryTarget,
      'difficulty': difficulty,
      'preparationTime': preparationTime,
      'description': description,
      'preparer': preparer,
      'rate': rate,
      'likes': likes,
      'image': image,
      'video': video,
    };
  }

  static RetseptModel initialValue() => RetseptModel(
        id: '',
        name: '',
        category: '',
        dietaryTarget: '',
        difficulty: '',
        preparationTime: '',
        description: '',
        preparer: '',
        rate: 0,
        likes: 0,
        image: '',
        video: '',
      );

  RetseptModel copyWith({
     String? id,
     String? name,
     String? category,
     String? dietaryTarget,
     String? difficulty,
     String? preparationTime,
     List<String>? ingredients,
     List<String>? preparation,
     String? description,
     String? preparer,
     double? rate,
     int? likes,
     String? image,
     String? video,
     List<String>? coments,
}) => RetseptModel(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        dietaryTarget: dietaryTarget ?? this.dietaryTarget,
        difficulty: difficulty ?? this.difficulty,
        preparationTime: preparationTime ?? this.preparationTime,
        description: description ?? this.description,
        preparer: preparer ?? this.preparer,
        rate: rate ?? this.rate,
        likes: likes ?? this.likes,
        image: image ?? this.image,
        video: video ?? this.video,
      );
}
