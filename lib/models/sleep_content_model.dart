import 'package:hive/hive.dart';
part 'sleep_content_model.g.dart';

@HiveType(typeId: 2)
class SleepContent {
  @HiveField(0)
  final String category;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final int duration;
  @HiveField(4)
  final String audioUrl;

  SleepContent({
    required this.category,
    required this.name,
    required this.description,
    required this.duration,
    required this.audioUrl,
  });

// Factory constructor to create a SleepContent object from JSON
  // This method is used to convert the JSON data from the API into a Dart object.
  factory SleepContent.fromJson(Map<String, dynamic> json) {
    return SleepContent(
      category: json['category'],
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
      audioUrl: json['audio_url'],
    );
  }

  // Method to convert a SleepContent object to JSON
  // This method is used to convert the Dart object into a JSON object that can be sent to the API.

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'name': name,
      'description': description,
      'duration': duration,
      'audio_url': audioUrl,
    };
  }
}
