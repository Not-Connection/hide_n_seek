part of '_index.dart';

class HideData {
  final rxTitle = 'Hide Message'.inj();

  final rxCounter = 0.inj();

  final rxRandom = Prov.sample.st.rxRandom;

  final rxImageFile = RM.inject<File?>(() => null);

  final rxPickedFile = RM.inject<XFile?>(() => null);

  final rxHiddenMessage = RM.inject<String>(() => '');

  final rxForm = RM.injectForm(
    submit: () async {
      await Future.delayed(500.milliseconds);
      await _ct.hideMessage();
    },
    autovalidateMode: AutovalidateMode.onUserInteraction,
  );

  final rxMessage = RM.injectTextEditing(
    validateOnTyping: true,
    validators: [Validate.isNotEmpty],
  );
}
