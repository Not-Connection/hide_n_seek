part of '_index.dart';

abstract class Ctrl {
  static HomeCtrl get home => HomeCtrl();
  static HideCtrl get hide => HideCtrl();
  static SeekCtrl get seek => SeekCtrl();
}
