import 'package:flutter/material.dart';
import '../core/database/hive_service.dart';
import '../widgets/post_card.dart';
import 'create_post_screen.dart';
import 'calendar_view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final posts = HiveService.getAllPosts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('FB Content Manager'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CalendarViewScreen()),
              );
            },
          ),
        ],
      ),
      body: posts.isEmpty
          ? const Center(child: Text('No scheduled posts yet. Tap + to add.'))
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostCard(post: posts[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreatePostScreen()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
