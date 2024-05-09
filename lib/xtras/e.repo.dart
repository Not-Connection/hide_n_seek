part of '_index.dart';

abstract class Repo {
  static Injected<SampleRepo> get sample => _sampleRepo;
  static Injected<SteganographRepo> get steganograph => _steganographRepo;
}

final _sampleRepo = RM3.inj(SampleRepo());

final _steganographRepo = RM3.inj(SteganographRepo());
