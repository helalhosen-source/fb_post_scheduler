import 'package:hive/hive.dart';

part 'scheduled_post.g.dart';

@HiveType(typeId: 0)
class ScheduledPost extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String content;

  @HiveField(2)
  final String? imagePath;

  @HiveField(3)
  final DateTime scheduledTime;

  @HiveField(4)
  final String postType; // 'Personal' or 'Page'

  @HiveField(5)
  bool isPublished;

  ScheduledPost({
    required this.id,
    required this.content,
    this.imagePath,
    required this.scheduledTime,
    required this.postType,
    this.isPublished = false,
  });
}
