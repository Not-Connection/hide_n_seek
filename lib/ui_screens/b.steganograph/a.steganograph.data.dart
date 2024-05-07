part of '_index.dart';

class SteganographData {
  final rxTitle = 'Steganograph'.inj();

  final rxCounter = 0.inj();

  final rxRandom = Prov.sample.st.rxRandom;

  final rxImageFile = RM.inject<File?>(() => null);

  final rxHiddenMessage = RM.inject<String>(() => '');

  final rxForm = RM.injectForm(
    submit: () async {
      await Future.delayed(400.milliseconds);
      _ct.hideMessage();
    },
    autovalidateMode: AutovalidateMode.onUserInteraction,
  );

  final rxMessage = RM.injectTextEditing(
    validateOnTyping: true,
    validators: [Validate.isNotEmpty],
  );
}
