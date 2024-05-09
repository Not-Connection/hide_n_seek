part of '_index.dart';

class SteganographRepo {
  int giveNewRandom() {
    final x = Random().nextInt(100);
    logz.s('random value coming from SteganographRepo');
    return x;
  }
}