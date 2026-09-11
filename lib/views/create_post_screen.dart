import 'package:flutter/material.dart';
import '../core/database/hive_service.dart';
import '../core/services/notification_service.dart';
import '../models/scheduled_post.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _captionController = TextEditingController();
  DateTime _selectedDate = DateTime.now().add(const Duration(minutes: 5));

  Future<void> _schedulePost() async {
    if (_captionController.text.trim().isEmpty) return;

    final String id = DateTime.now().millisecondsSinceEpoch.toString();
    final newPost = ScheduledPost(
      id: id,
      content: _captionController.text.trim(),
      scheduledTime: _selectedDate,
      postType: 'Personal',
    );

    // Save locally to Hive
    await HiveService.addPost(newPost);

    // Register Push Notification for Option B Flow
    await NotificationService.schedulePersonalPostNotification(
      id: newPost.hashCode,
      title: 'Time to Post on Facebook!',
      body: 'Tap to copy caption and open Facebook app.',
      scheduledDate: _selectedDate,
      postContent: newPost.content,
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Post successfully scheduled!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Scheduled Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _captionController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Write your caption or post content...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: Text("Scheduled Time: ${_selectedDate.toString()}"),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (picked != null) {
                  setState(() {
                    _selectedDate = picked;
                  });
                }
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _schedulePost,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Schedule Personal Post'),
            )
          ],
        ),
      ),
    );
  }
}
