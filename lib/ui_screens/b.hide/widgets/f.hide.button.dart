part of '../_index.dart';

class HideButton extends StatelessWidget {
  const HideButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: _dt.rxForm,
      builder: () {
        return OnFormSubmissionBuilder(
          listenTo: _dt.rxForm,
          onSubmitting: () => const CircularProgressIndicator(),
          child: ElevatedButton.icon(
            icon: const Icon(Icons.lock),
            label: const Text('Hide Message'),
            onPressed: _dt.rxForm.isValid ? () => _ct.submit() : null,
          ),
        );
      },
    );
  }
}
