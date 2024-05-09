part of '../_index.dart';

class SeekButton extends StatelessWidget {
  const SeekButton({
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
            icon: const Icon(Icons.lock_open),
            label: const Text('Reveal Message'),
            onPressed: () => _ct.submit(),
          ),
        );
      },
    );
  }
}
