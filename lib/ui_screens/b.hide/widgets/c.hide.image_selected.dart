part of '../_index.dart';

class HideImageSelected extends StatelessWidget {
  const HideImageSelected({
    super.key,
  });

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
                      const HidePickedImageTile(),
                      const SizedBoxH(20),
                      const HideFormMessage(),
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
                      const HideEncryptionKey(),
                      const SizedBoxH(20),
                      const HideButton(),
                      const SizedBoxH(15),
                      const HideResult(),
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }
}
