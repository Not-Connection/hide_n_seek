part of '../_index.dart';

class SeekImageSelected extends StatelessWidget {
  const SeekImageSelected({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: OnFormBuilder(
              listenTo: _dt.rxForm,
              builder: () {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SeekPickedImageTile(),
                      const SizedBoxH(10),
                      OnReactive(
                        () => Row(
                          children: [
                            Checkbox(
                              value: _dt.rxIsUseEncryptKey.st,
                              onChanged: (value) {
                                _dt.rxIsUseEncryptKey.setState((s) => value);
                              },
                            ),
                            const Text('Encryption key (length = 32)'),
                          ],
                        ),
                      ),
                      const SeekEncryptionKey(),
                      const SizedBoxH(20),
                      const SeekButton(),
                      const SizedBoxH(20),
                      const SeekHiddenMessage(),
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }
}
