import 'package:flutter/material.dart';
import 'package:ready_pagination/pagination/ui/view/page_screen.dart';

import 'core/services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServiceLocator.initAppServiceLocator();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PostsOverviewScreen(),
    );
  }
}
