part of '../_index.dart';

class HideFormMessage extends StatelessWidget {
  const HideFormMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: _dt.rxForm,
      builder: () => TextField(
        controller: _dt.rxMessage.controller,
        focusNode: _dt.rxMessage.focusNode,
        maxLines: 10,
        onEditingComplete: () => _dt.rxMessage.focusNode.unfocus(),
        decoration: InputDecoration(
          isDense: true,
          alignLabelWithHint: true,
          labelText: 'Message',
          hintText: 'Enter the message you want to hide',
          errorText: _dt.rxMessage.error,
          suffixIcon: OnReactive(
            () => _dt.rxMessage.text.isNotEmpty
                ? IconButton(
                    tooltip: 'Clear',
                    onPressed: () {
                      _dt.rxMessage.reset();
                    },
                    icon: const Icon(
                      Icons.close,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
