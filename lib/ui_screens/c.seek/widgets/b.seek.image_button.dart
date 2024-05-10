part of '../_index.dart';

class SeekImageButton extends StatelessWidget {
  const SeekImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
          child: InkWell(
            child: Image.asset('assets/images/gallery.png'),
          ),
        ),
        ElevatedButton.icon(
          icon: const Icon(Icons.add),
          label: const Text('Add Image'),
          onPressed: () async {
            if (_pv.rxPreviousImage.st == null) {
              await _ct.pickImage();
            } else {
              nav.toDialog(
                _ct.imagePickerDialog(onPreviousImagePressed: () {
                  _dt.rxPickedFile.st = _sv.pickedPreviousEncodedImage();
                  nav.back();
                }, onGalleryPressed: () async {
                  await _ct.pickImage();
                  nav.back();
                }),
              );
            }
          },
        ),
        const SizedBoxH(20),
        const Text('It\'s empty! Add an image to start Decoding.'),
      ],
    );
  }
}
