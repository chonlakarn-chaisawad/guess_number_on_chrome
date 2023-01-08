import 'dart:io';

import 'game.dart';

void main() {
  var game = Game(maxRandom: 10);
  GuessResult? guessResult;

  print('╔═════════════════════════════════════════════════════════════');
  print('║  (ﾉ´ ･ᴗ･`)ﾉ*:･ﾟ✧ ▲ GUESS THE NUMBER ▼ ✧ﾟ･:*ヽ(´･ᴗ･ `ヽ)  ');
  print('╟─────────────────────────────────────────────────────────────');

  do {
    stdout.write('║ Guess the number between 1 and 10 : ');
    var input = stdin.readLineSync();

    if (input == null) {
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
      print('║ (*^◇^)/ﾟ・:*・* [[BINGO!! $guess is CORRECT ]] *・*:・ﾟ＼(^◇^*)');
      print(
          '║     (*^◇^)/ﾟ・:* [[You guessed ${game.totalGuesses} times]] *:・ﾟ＼(^◇^*)    ');
      print('╚═════════════════════════════════════════════════════════════');
    } else if (guessResult == GuessResult.tooLow) {
      print('║ (ಠ_ಠ) $guess is TOO LOW! ▼ ');
      print('╟─────────────────────────────────────────────────────────────');
    } else {
      print('║ (ಠ_ಠ) $guess is TOO HIGH! ▲ ');
      print('╟─────────────────────────────────────────────────────────────');
    }
  } while (guessResult != GuessResult.correct);

  var ans;
  do {
    stdout.write('Play Again? (Y/N) : ');
    ans = stdin.readLineSync();

    if (ans == "Y" || ans == "y") {
      Game.memberScore.add(game.totalGuesses);
      main();
      break;
    } else if (ans == "N" || ans == "n") {
      Game.memberScore.add(game.totalGuesses);
      print("");
      print("");
      print("You've played ${Game.memberScore.length} games");
      for (var i = 0; i < Game.memberScore.length; i++) {
        print("🚀 Game #${i + 1} : ${Game.memberScore[i]}");
      }
      break;
    }
  } while (ans != null);
}
