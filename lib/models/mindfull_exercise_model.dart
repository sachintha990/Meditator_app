import 'package:hive/hive.dart';


@HiveType(typeId: 1)
class MindfulnessExercise {
  @HiveField(0)
  final String category;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final List<String> instructions;
  @HiveField(4)
  final int duration;
  @HiveField(5)
  final String instructionsUrl;
  @HiveField(6)
  final String imagePath;

  MindfulnessExercise({
    required this.category,
    required this.name,
    required this.description,
    required this.instructions,
    required this.duration,
    required this.instructionsUrl,
    required this.imagePath,
  });

// Factory constructor to create a MindfulnessExercise object from JSON
  factory MindfulnessExercise.fromJson(Map<String, dynamic> json) {
    return MindfulnessExercise(
      category: json['category'],
      name: json['name'],
      description: json['description'],
      instructions: List<String>.from(json['instructions']),
      duration: json['duration'],
      instructionsUrl: json['instructions_url'],
      imagePath: json['image_url'],
    );
  }

// Method to convert a MindfulnessExercise object to JSON
  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'name': name,
      'description': description,
      'instructions': instructions,
      'duration': duration,
      'instructions_url': instructionsUrl,
      'image_url': imagePath,
    };
  }
}
