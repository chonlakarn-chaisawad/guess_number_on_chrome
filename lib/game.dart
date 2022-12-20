import 'dart:math';

enum GuessResult { correct, tooHigh, tooLow }

class Game {
  final int answer;
  int _totalGuesses = 0;
  //constructor
  Game({required int maxRandom}) : answer = Random().nextInt(maxRandom) + 1 {
    print('Answer is $answer');
  }

  GuessResult doGuess(int guess) {
    _totalGuesses++;

    //todo:
    if (guess > answer) {
      return GuessResult.tooHigh;
    } else if (guess < answer) {
      return GuessResult.tooLow;
    } else {
      return GuessResult.correct;
    }
  }

  int get totalGuesses {
    return _totalGuesses;
  }
}
