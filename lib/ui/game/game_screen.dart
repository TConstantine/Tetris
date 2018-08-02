import 'package:flutter/material.dart';
import 'package:tetris/data/model/game.dart';
import 'package:tetris/ui/game/game_contract.dart';
import 'package:tetris/ui/game/game_presenter.dart';

class GameScreen extends StatelessWidget {
  final Game _game = Game();
  GameContractPresenter _presenter;

  @override
  Widget build(BuildContext context) {
    _game.start();
    _presenter = GamePresenter(_game);
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
          _buildTopPanel(screenWidth, screenHeight * 0.2),
          _buildBottomPanel(screenWidth, screenHeight * 0.8),
        ],
      ),
    );
  }

  Widget _buildTopPanel(double width, double height) {
    final double sideMargin = 10.0;
    final double topPanelWidth = width - sideMargin * 2;
    final double holdTetrominoPanelWidth = topPanelWidth * 0.2;
    final double statisticsPanelWidth = topPanelWidth * 0.6;
    final double nextTetrominoPanelWidth = topPanelWidth * 0.2;
    return Container(
      width: topPanelWidth,
      height: height,
      margin: EdgeInsets.only(
        left: sideMargin,
        right: sideMargin,
      ),
      child: Row(
        children: <Widget>[
          _buildHoldTetrominoPanel(holdTetrominoPanelWidth, holdTetrominoPanelWidth),
          _buildStatisticsPanel(statisticsPanelWidth, height),
          _buildNextTetrominoPanel(nextTetrominoPanelWidth, holdTetrominoPanelWidth),
        ],
      ),
    );
  }

  Widget _buildHoldTetrominoPanel(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
    );
  }

  Widget _buildStatisticsPanel(double width, double height) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.only(left: 10.0),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Level: ${_game.level()}'),
          Text('Score: ${_game.score()}'),
          Text('Lines: ${_game.lines()}'),
        ],
      ),
    );
  }

  Widget _buildNextTetrominoPanel(double width, double height) {
    return Container(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _presenter.nextTetrominoRenderer(),
      ),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
    );
  }

  Widget _buildBottomPanel(double width, double height) {
    final double sidePanelWidth = width * 0.15;
    final double middlePanelWidth = width * 0.7;
    return Container(
      width: width,
      height: height,
      child: Row(
        children: <Widget>[
          _buildLeftPanel(sidePanelWidth, height),
          _buildBoardPanel(middlePanelWidth, height * 0.95),
          _buildRightPanel(sidePanelWidth, height),
        ],
      ),
    );
  }

  Widget _buildLeftPanel(double width, double height) {
    return Container(
      width: width,
      height: height,
    );
  }

  Widget _buildBoardPanel(double width, double height) {
    return Container(
      width: width,
      height: height,
      child: Center(
        child: Text(
          'Touch to start',
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(),
          right: BorderSide(),
          bottom: BorderSide(),
        ),
      ),
    );
  }

  Widget _buildRightPanel(double width, double height) {
    return Container(
      width: width,
      height: height,
    );
  }
}