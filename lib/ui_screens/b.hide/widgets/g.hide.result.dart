part of '../_index.dart';

class HideResult extends StatelessWidget {
  const HideResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OnReactive(
      () => Visibility(
        visible: _dt.rxHiddenMessage.st.isNotEmpty,
        child: Column(
          children: [
            Card(
              child: SizedBox(
                height: 30,
                width: 250,
                child: Center(
                  child: Text(
                    _dt.rxHiddenMessage.st,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBoxH(15),
            Card(
              child: ListTile(
                contentPadding: const EdgeInsets.only(right: 5),
                leading: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.file(
                    File('${_dt.rxImageFile.st?.path}'),
                  ),
                ),
                onTap: () {
                  _ct.showImagePreview(
                    'Encoded Image',
                    _dt.rxImageFile.st!.path,
                  );
                },
                title: const Text(
                  'Encoded Image',
                  textScaler: TextScaler.linear(0.7),
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      tooltip: 'Share Image',
                      icon: const Icon(Icons.share),
                      onPressed: () {
                        _ct.shareFile(context);
                      },
                    ),
                    const SizedBoxW(10),
                    // IconButton(
                    //   tooltip: 'Download Image',
                    //   icon: const Icon(Icons.download),
                    //   onPressed: () {},
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
