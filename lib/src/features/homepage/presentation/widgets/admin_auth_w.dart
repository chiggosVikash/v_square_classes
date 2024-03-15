import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vsquareclasses/src/features/admin/homepage/presentation/screens/home_s.dart';

class AdminAuthW extends ConsumerStatefulWidget {
  const AdminAuthW({super.key});

  @override
  ConsumerState<AdminAuthW> createState() => _AdminAuthWState();
}

class _AdminAuthWState extends ConsumerState<AdminAuthW> {
  final TextEditingController _adminPasswordController = TextEditingController();

  @override
  void dispose() {
    _adminPasswordController.dispose();
    super.dispose();
  }
@override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Admin Authentication'),
      content: TextField(
        controller: _adminPasswordController,
        decoration: const InputDecoration(
          hintText: 'Enter the admin password',
        ),
      ),actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            /// TODO: Implement admin authentication
            context.pop();
            // context.goNamed(HomeS.routeName);
            GoRouter.of(context).push(HomeS.routeAddress);
            // Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeS()));
          },
          child: const Text('Submit'),
        ),
      ]);
  }
}
