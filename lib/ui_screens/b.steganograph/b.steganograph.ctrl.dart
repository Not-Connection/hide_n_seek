part of '_index.dart';

class SteganographCtrl {
  init() => logxx.i(SteganographCtrl, '...');

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

  submit() async => _dt.rxForm.submit();

  Future<void> shareFile() async {
    final result = await Share.shareXFiles([XFile(_dt.rxImageFile.st!.path)], text: 'Great picture');

    if (result.status == ShareResultStatus.success) {
      print('Thank you for sharing the picture!');
    }
  }

  Future<void> hideMessage() async {
    // if (_dt.rxImageFile.st == null) {
    //   _showSnackBar(context, 'Please select an image first.');
    //   return;
    // }
    String message = _dt.rxMessage.text;
    // if (message.isEmpty) {
    //   _showSnackBar(context, 'Please enter a message to hide.');
    //   return;
    // }

    Steganograph.encode(image: File(_dt.rxImageFile.st!.path), message: message).then((encodedImage) {
      _dt.rxImageFile.st = File(encodedImage!.path);
      logx.wtf(_dt.rxImageFile.st!.path.toString());
      _dt.rxMessage.reset();
      _dt.rxHiddenMessage.st = 'Message hidden successfully!';
    });
    // .catchError((error) {
    //   _showSnackBar(context, 'Error: $error');
    // });
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
