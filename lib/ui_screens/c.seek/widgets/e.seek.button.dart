part of '../_index.dart';

class SeekButton extends StatelessWidget {
  const SeekButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OnReactive(
      () => OnFormBuilder(
        listenTo: _dt.rxForm,
        builder: () {
          return OnFormSubmissionBuilder(
              listenTo: _dt.rxForm,
              onSubmitting: () => const CircularProgressIndicator(),
              child: OnReactive(
                () => _dt.rxForm.isWaiting
                    ? const CircularProgressIndicator()
                    : ElevatedButton.icon(
                        icon: const Icon(Icons.lock),
                        label: const Text('Hide Message'),
                        onPressed: _dt.rxIsUseEncryptKey.st
                            ? _dt.rxForm.isValid
                                ? () => _ct.submit()
                                : null
                            : () => _ct.submit(),
                      ),
              ));
        },
      ),
    );
  }
}
