part of '../_index.dart';

class SeekHiddenMessage extends StatelessWidget {
  const SeekHiddenMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: _dt.rxForm,
      builder: () => TextField(
        controller: _dt.rxMessage.controller,
        focusNode: _dt.rxMessage.focusNode,
        minLines: 1,
        maxLines: 10,
        readOnly: true,
        decoration: InputDecoration(
          isDense: true,
          alignLabelWithHint: true,
          labelText: 'Message',
          errorText: _dt.rxMessage.error,
          suffixIcon: OnReactive(
            () => _dt.rxMessage.text.isNotEmpty
                ? IconButton(
                    tooltip: 'Copy to Clipboard',
                    onPressed: () {
                      FlutterClipboard.copy(_dt.rxMessage.text).then(
                        (value) => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 2),
                            content: const Text(
                              'Text Copied',
                              textAlign: TextAlign.center,
                            ),
                            behavior: SnackBarBehavior.floating,
                            width: 120,
                            backgroundColor: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.copy_rounded,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
