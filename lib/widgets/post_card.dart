import 'package:flutter/material.dart';
import '../models/scheduled_post.dart';
import '../core/constants/app_colors.dart';

class PostCard extends StatelessWidget {
  final ScheduledPost post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    Color statusColor = AppColors.scheduledCard;
    String statusText = 'Scheduled';

    if (post.isPublished) {
      statusColor = AppColors.publishedCard;
      statusText = 'Published';
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(post.content, maxLines: 2, overflow: TextOverflow.ellipsis),
        subtitle: Text('Time: ${post.scheduledTime.toString().substring(0, 16)} | Type: ${post.postType}'),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            statusText,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
