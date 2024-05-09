part of '_index.dart';

class SeekView extends StatelessWidget {
  const SeekView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: SeekAppbar(),
      ),
      body: Center(
        child: OnReactive(
          () => _dt.rxPickedFile.st == null ? const SeekImageButton() : const SeekImageSelected(),
        ),
      ),
    );
  }
}
