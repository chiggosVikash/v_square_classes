
import 'package:flutter/material.dart';
import 'package:vsquareclasses/src/features/homepage/presentation/widgets/admin_auth_w.dart';

class HomepageS extends StatefulWidget {
  static const routeAddress = '/';
  static const routeName = 'Home';
  const HomepageS({super.key,});




  @override
  State<HomepageS> createState() => _HomepageSState();
}

class _HomepageSState extends State<HomepageS> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed:(){
            _showAdminAuthDialogue();
          },icon:const Icon(Icons.admin_panel_settings))
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,


        title: const Text("VSquare Classes"),
      ),
      body: const Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  void _showAdminAuthDialogue(){
    showDialog(context: context, builder: (context)=> const AdminAuthW());
  }
}