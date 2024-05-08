part of '_index.dart';

class SeekCtrl {
  init() => logxx.i(SeekCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      _dt.rxPickedFile.st = pickedImage;
    }
    //  final image = img.decodeImage( File('${_dt.rxPickedFile.st?.path}').readAsBytesSync());
    //     ui.Image imageN;
    //       final paint = await PaintingBinding.instance.instantiateImageCodec(img.encodePng(image!, level: 0));
    //       final nextFrame = await paint.getNextFrame();
    //       imageN = nextFrame.image;

    //     return imageN;
  }

  submit() async => _dt.rxForm.submit();

  Future<void> revealMessage(BuildContext context) async {
    if (_dt.rxImageFile.st == null) {
      _showSnackBar(context, 'Please select an image first.');
      return;
    }

    Steganograph.decode(image: File(_dt.rxImageFile.st!.path)).then((decodedMessage) {
      _dt.rxMessage.controller.text = decodedMessage!;
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
