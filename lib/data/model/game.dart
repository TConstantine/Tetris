class Game {
  bool _isPaused;

  void start() {
    _isPaused = true;
  }

  bool isPaused() {
    return _isPaused;
  }
}