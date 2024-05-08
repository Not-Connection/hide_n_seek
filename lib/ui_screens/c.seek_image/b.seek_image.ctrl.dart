part of '_index.dart';

class SeekImageCtrl {
  init() => logxx.i(SeekImageCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _dt.rxImageFile.st = File(pickedImage.path);
      logx.w(_dt.rxImageFile.st!.path.toString());
    }
  }

  Future<void> revealMessage(BuildContext context) async {
    if (_dt.rxImageFile.st == null) {
      _showSnackBar(context, 'Please select an image first.');
      return;
    }

    Steganograph.decode(image: File(_dt.rxImageFile.st!.path)).then((decodedMessage) {
      _dt.rxHiddenMessage.st = decodedMessage!;
    }).catchError((error) {
      _showSnackBar(context, 'Error: $error');
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ));
  }
}
