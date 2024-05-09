part of '_index.dart';

class SteganographProv {
  final rxRandom = RM.inject<int>(
    () => 0,
    autoDisposeWhenNotUsed: false,
    sideEffects: SideEffects(
      onSetState: (p0) => _sv.onSetState(),
    ),
  );

  final rxPreviousImage = RM.inject<XFile?>(() => null);
}
