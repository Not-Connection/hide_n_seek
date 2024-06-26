part of '_index.dart';

class HideCtrl {
  init() => logxx.i(HideCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  void showImagePreview(String name, String path) => _sv.showImagePreview(name, path);

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      _dt.rxPickedFile.st = pickedImage;
    }
  }

  Widget imagePickerDialog({
    Function()? onCameraPressed,
    Function()? onGalleryPressed,
  }) {
    return AlertDialog(
      title: const Text('Pick a source'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera'),
            onTap: onCameraPressed,
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Gallery'),
            onTap: onGalleryPressed,
          ),
        ],
      ),
    );
  }

  submit() async => _dt.rxForm.submit();

  Future<void> shareFile(BuildContext context) async {
    final result = await Share.shareXFiles(
      [XFile(_dt.rxImageFile.st!.path)],
      text: 'Check this out',
    );

    if (result.status == ShareResultStatus.success) {
      // ignore: use_build_context_synchronously
      _showSnackBar(context, 'Thank you for sharing the picture!');
    }
  }

  Future<void> hideMessage() async {
    // _dt.rxIsLoading.st = true;
    String message = _dt.rxMessage.text;

    _dt.rxImageFile.st = File(_dt.rxPickedFile.st!.path);
    await Steganograph.encode(
      image: File(
        _dt.rxImageFile.st!.path,
      ),
      message: message,
      encryptionKey: _dt.rxIsUseEncryptKey.st ? _dt.rxEncryptionKey.controller.text : null,
    ).then((encodedImage) async {
      await Future.delayed(200.milliseconds);
      _dt.rxImageFile.st = File(encodedImage!.path);
      _dt.rxHiddenMessage.st = 'Message hidden successfully!';
      _dt.rxMessage.reset();

      _pv.rxPreviousImage.st = XFile(_dt.rxImageFile.st!.path);
    });
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
