import 'package:flutter/material.dart';

void main() {
  runApp(const GamePage());
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Guess the Number'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // ให้อยู่ตรงกลาง
                children: [
              Icon(Icons.person, size: 200, color: Colors.pink),
              Text('Guess the number between 1 and 100'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // ให้อยู่ตรงกลาง
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        ElevatedButton(onPressed: () {}, child: Text('Guess')),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('Guess'))
                ],
              )
            ])));
  }
}
