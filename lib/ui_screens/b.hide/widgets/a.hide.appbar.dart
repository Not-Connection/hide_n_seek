part of '../_index.dart';

class HideAppbar extends StatelessWidget {
  const HideAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: OnReactive(() => Text(_dt.rxTitle.st)),
    );
  }
}
