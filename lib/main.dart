import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Xylophone'),
          centerTitle: true,
        ),
        body: MusicPage(),
      ),
    );
  }
}

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource("note$soundNumber.wav"));
  }

  Expanded soundButton({required Color color, required int soundNumber}) {
    return Expanded(
      child: MaterialButton(
        enableFeedback: false,
        color: color,
        onPressed: () {
          playSound(soundNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        soundButton(color: Colors.red, soundNumber: 1),
        soundButton(color: Colors.orange, soundNumber: 2),
        soundButton(color: Colors.yellow, soundNumber: 3),
        soundButton(color: Colors.green, soundNumber: 4),
        soundButton(color: Colors.blue, soundNumber: 5),
        soundButton(color: Colors.cyan, soundNumber: 6),
        soundButton(color: Colors.deepPurple, soundNumber: 7),
      ],
    );
  }
}
