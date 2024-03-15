import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewCoursesS extends ConsumerStatefulWidget {
  static const routeAddress = 'view-courses';
  static const routeName = 'View Courses';
  const ViewCoursesS({super.key});

  @override
  ConsumerState<ViewCoursesS> createState() => _ViewCoursesSState();
}

class _ViewCoursesSState extends ConsumerState<ViewCoursesS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Courses'),
      ),
      body: const Center(
        child: Text('View Courses'),
      ),
    );
  }
}
