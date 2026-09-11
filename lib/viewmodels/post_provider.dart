import 'package:flutter/material.dart';
import 'models/scheduled_post.dart';

class PostProvider extends ChangeNotifier {
  List<ScheduledPost> _posts = [];

  List<ScheduledPost> get posts => _posts;

  void setPosts(List<ScheduledPost> newPosts) {
    _posts = newPosts;
    notifyListeners();
  }
}
