import 'package:cloud_firestore/cloud_firestore.dart';

class SnakeModel {
  final String id;
  final String snake_name;
  final String des;
  final String scince_name;
  final image_url;

  const SnakeModel({
    required this.id,
    required this.snake_name,
    required this.des,
    required this.scince_name,
    required this.image_url,
  });

  factory SnakeModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return SnakeModel(
        id: document.id,
        snake_name: data!["Name"],
        des: data["Description"],
        scince_name: data["Scientific Name"],
        image_url: data["image"]);
  }
}
