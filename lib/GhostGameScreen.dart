import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(GhostGameApp());
}

class GhostGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: '귀신 게임',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GhostGameScreen(),
    );
  }
}

class GhostGameScreen extends StatefulWidget {
  @override
  _GhostGameScreenState createState() => _GhostGameScreenState();
}

class _GhostGameScreenState extends State<GhostGameScreen> {
  bool isPlayerOneTurn = true;
  bool ghostAppeared = false;
  String message = "게임을 시작하세요";
  String ghostEmoji = "👻";
  String normalEmoji = "😃";
  double emojiSize = 100.0; // 이모티콘 크기

  void _onButtonPressed() {
    setState(() {
      ghostAppeared = Random().nextDouble() < 0.05; // 귀신이 나올 확률을 10%로 설정
      if (ghostAppeared) {
        message = isPlayerOneTurn
            ? "플레이어 1이 졌습니다! $ghostEmoji"
            : "플레이어 2가 졌습니다! $ghostEmoji";
      } else {
        message = isPlayerOneTurn
            ? "플레이어 2의 차례 $normalEmoji"
            : "플레이어 1의 차례 $normalEmoji";
      }
      isPlayerOneTurn = !isPlayerOneTurn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('귀신 게임'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              message,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              ghostAppeared ? ghostEmoji : normalEmoji,
              style: TextStyle(fontSize: emojiSize), // 이모티콘 크기 조정
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onButtonPressed,
              child: Text('눌러보세요'),
            ),
          ],
        ),
      ),
    );
  }
}
