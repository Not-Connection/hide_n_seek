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
        ),
      ),
    );
  }
}
