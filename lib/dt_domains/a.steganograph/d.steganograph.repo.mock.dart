part of '_index.dart';

class SteganographRepoMock implements SteganographRepo {
  @override
  int giveNewRandom() {
    final x = Random().nextInt(100);
    logz.wtf('random value coming from SteganographRepoMock');
    return x;
  }
}