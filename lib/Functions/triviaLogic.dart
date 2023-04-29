
import 'package:hackatlon_app/Functions/domande.dart';

List<Quiz> generateTrivia(len) {
  List<Quiz> game = Quizes;
  game.shuffle();

  game.length = len;
  return game;
}
