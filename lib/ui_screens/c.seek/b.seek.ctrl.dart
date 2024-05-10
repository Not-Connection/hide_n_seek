part of '_index.dart';

class SeekCtrl {
  init() => logxx.i(SeekCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  void showImagePreview(String name, String path) => _sv.showImagePreview(name, path);

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    _dt.rxPickedFile.st = pickedImage;

    if (_dt.rxPickedFile.st == null) {
      logx.e('image is empty');
      return;
    }

    //* convert image's type to PNG
    File imagePath = File(_dt.rxPickedFile.st!.path);
    final tempDir = await getTemporaryDirectory();

    int rand = Random().nextInt(10000);

    if (_dt.rxPickedFile.st!.mimeType != 'image/png') {
      img.Image? imageRaw = img.decodeImage(imagePath.readAsBytesSync());
      File compressedImage = File('${tempDir.path}/img_$rand.png')..writeAsBytesSync(img.encodePng(imageRaw!));
      logx.wtf(compressedImage.path.toString());

      _dt.rxImagePathRaw.st = compressedImage.path;
    } else {
      _dt.rxImagePathRaw.st = _dt.rxPickedFile.st!.path;
    }
  }

  submit() async => _dt.rxForm.submit();

  Future<void> revealMessage() async {
    if (_pv.rxPreviousImage.st != null) {
      _dt.rxImagePathRaw.st = _dt.rxPickedFile.st!.path;
    }
    _dt.rxImageFile.st = File(_dt.rxImagePathRaw.st);

    logx.w(_dt.rxImageFile.st!.path.toString());

    await Steganograph.decode(
      image: File(_dt.rxImageFile.st!.path),
      encryptionKey: _dt.rxIsUseEncryptKey.st ? _dt.rxEncryptionKey.controller.text : null,
    ).then((decodedMessage) async {
      await Future.delayed(200.milliseconds);

      logx.i('decode message: $decodedMessage');
      if (decodedMessage != null) {
        _dt.rxMessage.controller.text = decodedMessage;
      } else {
        nav.toDialog(
          CupertinoAlertDialog(
            title: const Text('Warning!'),
            content: const Text(
              'Image not supported. Try to pick another image that may contain a hidden message',
            ),
            actions: [
              TextButton(
                onPressed: () => nav.back(),
                child: const Text('Later'),
              ),
              TextButton(
                onPressed: () async {
                  await _ct.pickImage();
                  nav.back();
                },
                child: const Text('Pick Another'),
              )
            ],
          ),
        );
      }
    }).catchError((error) {
      nav.toDialog(
        CupertinoAlertDialog(
          title: const Text('Error Message'),
          content: Text(
            'Error: $error',
          ),
          actions: [
            TextButton(
              onPressed: () => nav.back(),
              child: const Text('GOT IT'),
            ),
          ],
        ),
      );
    });
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ));
  }

  Widget imagePickerDialog({
    Function()? onPreviousImagePressed,
    Function()? onGalleryPressed,
  }) {
    return AlertDialog(
      title: const Text('Pick a source'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Use Previous Encoded Image'),
            onTap: onPreviousImagePressed,
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
}
