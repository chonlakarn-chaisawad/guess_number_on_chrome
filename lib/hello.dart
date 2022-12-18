import 'dart:io';
import 'dart:math';

void main() {
  var r = Random();
  var answer = r.nextInt(100) + 1;
  var guess;
  var count = 0;
  var isCorrect = false;
  //print(answer);
  print('╔═════════════════════════════════════════════════════════════');
  print('║  (ﾉ´ ･ᴗ･`)ﾉ*:･ﾟ✧ ▲ GUESS THE NUMBER ▼ ✧ﾟ･:*ヽ(´･ᴗ･ `ヽ)  ');
  print('╟─────────────────────────────────────────────────────────────');
  do {
    //print('Guess the number between 1 and 100 : ');
    stdout.write('║ Guess the number between 1 and 100 : ');
    var input = stdin.readLineSync();
    //print('Your input is $input');

    if (input == null) {
      print('║ Σ (O_O) . . . Error , input is NULL ');
      return;
    }

    guess = int.tryParse(input);

    if (guess == null) {
      print('║     ⇾ Input error,Enter numbers only,Please try again ⇽    ');
      print('║     (╮° - °) ╮┳━━┳ (╯°□°) ╯┻━━┻ . . . . ┬─┬ ノ (º _ º ノ)    ');
      continue;
    }

    //todo:call doGuess
    count++;
    isCorrect = doGuess(guess, answer, count);
  } while (!isCorrect);
}

bool doGuess(int guess, int answer, int count) {
  if (guess > answer) {
    print('║ (ಠ_ಠ) $guess is TOO HIGH! ▲ ');
    print('╟─────────────────────────────────────────────────────────────');
    return false;
  } else if (guess < answer) {
    print('║ (ಠ_ಠ) $guess is TOO LOW! ▼ ');
    print('╟─────────────────────────────────────────────────────────────');
    return false;
  } else {
    print('║ (*^◇^)/ﾟ・:*・* [[BINGO!!! $guess is CORRECT ]] *・*:・ﾟ＼(^◇^*)');
    print('║     (*^◇^)/ﾟ・:* [[You guessed $count times]] *:・ﾟ＼(^◇^*)    ');
    print('╚═════════════════════════════════════════════════════════════');
    return true;
  }
}
