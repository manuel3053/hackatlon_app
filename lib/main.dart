import 'package:flutter/material.dart';
import 'package:hackatlon_app/Screens/home.dart';
import 'package:hackatlon_app/Screens/missions.dart';
import 'package:hackatlon_app/Screens/leaderbord.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 1;
  final PageController pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        title: Center(child: Text('Ciao (nomeutente)! (posizione°)')),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg.png'),
                  fit: BoxFit.cover
              )
          ),
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          controller: pageController,
          children: [
            Leaderboard(),
            Home(),
            Missions(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.greenAccent,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          if (pageController.hasClients) {
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut);
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'Missions',
          ),
        ],
      ),
    );
  }
}
