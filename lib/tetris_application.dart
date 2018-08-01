import 'package:flutter/material.dart';
import 'package:tetris/ui/mainmenu/main_menu_screen.dart';

class TetrisApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainMenuScreen(),
    );
  }
}
