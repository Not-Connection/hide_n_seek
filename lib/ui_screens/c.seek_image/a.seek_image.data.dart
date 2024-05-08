part of '_index.dart';

class SeekImageData {
  final rxTitle = 'Seek Image'.inj();

  final rxCounter = 0.inj();

  final rxRandom = Prov.sample.st.rxRandom;

  final rxImageFile = RM.inject<File?>(() => null);

  final rxHiddenMessage = RM.inject<String>(() => '');

  final rxMessage = RM.injectTextEditing(
    validateOnTyping: true,
  );
}
