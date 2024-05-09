part of '_index.dart';

abstract class Prov {
  static Injected<SampleProv> get sample => _sampleProv;
  static Injected<SteganographProv> get steganograph => _steganographProv;
}

final _sampleProv = RM2.inj(SampleProv());

final _steganographProv = RM2.inj(SteganographProv());
