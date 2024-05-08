part of '../_index.dart';

class HideImageButton extends StatelessWidget {
  const HideImageButton({
    super.key,
  });

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
          onPressed: () {
            nav.toDialog(
              _ct.imagePickerDialog(onCameraPressed: () async {
                await _ct.pickImage(ImageSource.camera);
                nav.back();
              }, onGalleryPressed: () async {
                await _ct.pickImage(ImageSource.gallery);
                nav.back();
              }),
            );
          },
        ),
        const SizedBoxH(20),
        const Text('It\'s empty! Add an image to start Encoding.'),
      ],
    );
  }
}
