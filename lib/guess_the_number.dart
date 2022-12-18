import 'dart:io';

import 'game.dart';

void main() {
  var game = Game();
  GuessResult? guessResult;

  print('╔═════════════════════════════════════════════════════════════');
  print('║  (ﾉ´ ･ᴗ･`)ﾉ*:･ﾟ✧ ▲ GUESS THE NUMBER ▼ ✧ﾟ･:*ヽ(´･ᴗ･ `ヽ)  ');
  print('╟─────────────────────────────────────────────────────────────');

  do {
    stdout.write('║ Guess the number between 1 and 100 : ');
    var input = stdin.readLineSync();

    if (input == null) {
      //print('║ Σ (O_O) . . . Error , input is NULL ');
      return;
    }

    var guess = int.tryParse(input);

    if (guess == null) {
      print('║     ⇾ Input error,Enter numbers only,Please try again ⇽    ');
      print('║     (╮° - °) ╮┳━━┳ (╯°□°) ╯┻━━┻ . . . . ┬─┬ ノ (º _ º ノ)    ');
      continue;
    }

    //todo:call doGuess
    guessResult = game.doGuess(guess);

    if (guessResult == GuessResult.correct) {
      print('║ (*^◇^)/ﾟ・:*・* [[BINGO!!! $guess is CORRECT ]] *・*:・ﾟ＼(^◇^*)');
      print('║     (*^◇^)/ﾟ・:* [[You guessed ${game.totalGuesses} times]] *:・ﾟ＼(^◇^*)    ');
      print('╚═════════════════════════════════════════════════════════════');
    } else if (guessResult == GuessResult.tooLow) {
      print('║ (ಠ_ಠ) $guess is TOO LOW! ▼ ');
      print('╟─────────────────────────────────────────────────────────────');
    } else {
      print('║ (ಠ_ಠ) $guess is TOO HIGH! ▲ ');
      print('╟─────────────────────────────────────────────────────────────');
    }
  } while (guessResult != GuessResult.correct);
}
