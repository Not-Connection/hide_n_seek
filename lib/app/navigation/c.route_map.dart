part of '_index.dart';

class RouteMap {
  RouteMap._();

  static final data = {
    Routes.home: (RouteData data) => const HomeView(),
    Routes.hide: (RouteData data) => const HideView(),
    Routes.seek: (RouteData data) => const SeekView(),
  };
}
