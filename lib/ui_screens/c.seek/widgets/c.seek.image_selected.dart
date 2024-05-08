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
                return const SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SeekPickedImageTile(),
                      SizedBoxH(20),
                      SeekButton(),
                      SizedBoxH(20),
                      SeekHiddenMessage(),
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }
}
