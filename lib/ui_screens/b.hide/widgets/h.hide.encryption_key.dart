part of '../_index.dart';

class HideEncryptionKey extends StatelessWidget {
  const HideEncryptionKey({super.key});

  @override
  Widget build(BuildContext context) {
    return OnReactive(
      () => _dt.rxIsUseEncryptKey.st
          ? OnFormBuilder(
              listenTo: _dt.rxForm,
              builder: () => TextField(
                controller: _dt.rxEncryptionKey.controller,
                focusNode: _dt.rxEncryptionKey.focusNode,
                maxLength: 32,
                onEditingComplete: () => _dt.rxEncryptionKey.focusNode.unfocus(),
                decoration: InputDecoration(
                  isDense: true,
                  errorText: _dt.rxEncryptionKey.error,
                  labelText: 'Secret key',
                  hintText: 'Enter your 32 characters encryption key',
                  alignLabelWithHint: true,
                  suffixIcon: OnReactive(
                    () => _dt.rxEncryptionKey.text.isNotEmpty
                        ? IconButton(
                            tooltip: 'Clear',
                            onPressed: () {
                              _dt.rxEncryptionKey.reset();
                            },
                            icon: const Icon(
                              Icons.close,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
