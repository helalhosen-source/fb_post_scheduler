import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../core/database/hive_service.dart';
import '../models/scheduled_post.dart';
import '../widgets/post_card.dart';

class CalendarViewScreen extends StatefulWidget {
  const CalendarViewScreen({super.key});

  @override
  State<CalendarViewScreen> createState() => _CalendarViewScreenState();
}

class _CalendarViewScreenState extends State<CalendarViewScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<ScheduledPost> _getPostsForDay(DateTime day) {
    final posts = HiveService.getAllPosts();
    return posts.where((post) {
      return post.scheduledTime.year == day.year &&
          post.scheduledTime.month == day.month &&
          post.scheduledTime.day == day.day;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final selectedPosts = _selectedDay != null ? _getPostsForDay(_selectedDay!) : [];

    return Scaffold(
      appBar: AppBar(title: const Text('Calendar View')),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: _getPostsForDay,
          ),
          const Divider(),
          Expanded(
            child: selectedPosts.isEmpty
                ? const Center(child: Text('No posts scheduled for this date.'))
                : ListView.builder(
                    itemCount: selectedPosts.length,
                    itemBuilder: (context, index) {
                      return PostCard(post: selectedPosts[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
