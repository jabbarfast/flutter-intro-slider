import 'package:flutter/material.dart';
import 'package:intro_slider/helper/global.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    //Getting device size
    screenSize = MediaQuery.sizeOf(context);

    return const Scaffold(
      body: Center(child: Text('Welcome to home screen')),
    );
  }
}
