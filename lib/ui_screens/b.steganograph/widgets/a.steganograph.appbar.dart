part of '../_index.dart';

class SteganographAppbar extends StatelessWidget {
  const SteganographAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: OnReactive(() => Text(_dt.rxTitle.st)),
    );
  }
}
