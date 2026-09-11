import 'package:flutter/material.dart';
import 'core/constants/app_theme.dart';
import 'core/database/hive_service.dart';
import 'core/services/notification_service.dart';
import 'views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Local Database & Local Notifications
  await HiveService.init();
  await NotificationService.init();

  runApp(const FBPushSchedulerApp());
}

class FBPushSchedulerApp extends StatelessWidget {
  const FBPushSchedulerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FB Content Manager',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
