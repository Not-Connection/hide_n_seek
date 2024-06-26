part of '_index.dart';

class HideView extends StatelessWidget {
  const HideView({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
       gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: HideAppbar(),
        ),
        body: Center(
          child: OnReactive(
            () => _dt.rxPickedFile.st == null ? const HideImageButton() : const HideImageSelected(),
          ),
        ),
      ),
    );
  }
}
