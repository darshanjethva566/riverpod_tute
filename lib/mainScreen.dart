import 'package:flutter/material.dart';
import 'package:riverpod_demo/futureprovider/futureprovider.dart';
import 'package:riverpod_demo/notifier/notifierui.dart';
import 'package:riverpod_demo/statenotifierprovider/statenotifierprovider.dart';
import 'package:riverpod_demo/stateprovider/demopage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DEmoPage(),));
            }, child: Text("StateProvider"))  ,

            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FutureProviderScreen(),));

            }, child: Text("FutureProvider")),

            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => StateNotfierDemo(),));

            }, child: Text("StateNotifier")),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotifierUi(),));

            }, child: Text("NotifierUi")),
          ],
        ),
      ),
    );
  }
}
