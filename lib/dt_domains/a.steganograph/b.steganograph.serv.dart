part of '_index.dart';

class SteganographServ {
  void init() {
    logxx.i(SteganographServ, '...');
  }

  void updateRandom() {
    _pv.rxRandom.st = _rp.giveNewRandom();
  }

  void onSetState() {
    logzz.i(SteganographServ, 'rxCounter setState success');
  }

  XFile? pickedPreviousEncodedImage() {
    return _pv.rxPreviousImage.st;
  }
}
