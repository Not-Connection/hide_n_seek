part of '_index.dart';

abstract class Data {
  static Injected<HomeData> get home => _homeData;
  static Injected<HideData> get hide => _hideData;
  static Injected<SeekData> get seek => _seekData;
}

final _homeData = RM1.inj(HomeData(), Ctrl.home.init);
final _hideData = RM1.inj(HideData(), Ctrl.hide.init);

final _seekData = RM1.inj(SeekData(), Ctrl.seek.init);
