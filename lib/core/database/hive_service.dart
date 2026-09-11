import 'package:hive_flutter/hive_flutter.dart';
import '../../models/scheduled_post.dart';

class HiveService {
  static const String postBoxName = 'scheduled_posts';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ScheduledPostAdapter());
    await Hive.openBox<ScheduledPost>(postBoxName);
  }

  static Box<ScheduledPost> getPostBox() {
    return Hive.box<ScheduledPost>(postBoxName);
  }

  static Future<void> addPost(ScheduledPost post) async {
    final box = getPostBox();
    await box.put(post.id, post);
  }

  static List<ScheduledPost> getAllPosts() {
    final box = getPostBox();
    return box.values.toList();
  }
}
