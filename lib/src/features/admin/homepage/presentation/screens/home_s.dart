
import 'package:flutter/material.dart';
import 'package:vsquareclasses/src/features/admin/homepage/presentation/widgets/admin_drawer_w.dart';

class HomeS extends StatefulWidget {
  static const routeAddress = '/admin/home';
  static const routeName = 'Admin Home';
  const HomeS({super.key});

  @override
  State<HomeS> createState() => _HomeSState();
}

class _HomeSState extends State<HomeS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AdminDrawerW(),
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Admin Dashboard"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'your are admin',
            ),
          ],
        ),
      ),
    );
  }
}
