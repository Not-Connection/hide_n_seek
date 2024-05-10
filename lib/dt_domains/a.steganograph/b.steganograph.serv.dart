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

  void showImagePreview(String name, String path) {
    nav.toDialog(
      CupertinoAlertDialog(
        title: Text(
          name,
        ),
        content: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
            height: 200,
            child: Image.file(
              File(path),
            ),
          ),
        ),
      ),
    );
  }
}
