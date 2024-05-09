part of '_index.dart';

class SeekData {
  final rxTitle = 'Seek'.inj();

  final rxCounter = 0.inj();

  final rxRandom = Prov.sample.st.rxRandom;

  final rxImageFile = RM.inject<File?>(() => null);

  final rxImagePathRaw = RM.inject<String>(() => '');

  final rxPickedFile = RM.inject<XFile?>(() => null);

  final rxForm = RM.injectForm(
    submit: () async {
      await Future.delayed(500.milliseconds);
      await _ct.revealMessage();
    },
    autovalidateMode: AutovalidateMode.onUserInteraction,
  );

  final rxMessage = RM.injectTextEditing(
    validateOnTyping: true,
  );
}
