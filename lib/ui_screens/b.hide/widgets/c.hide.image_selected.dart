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
                return const SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HidePickedImageTile(),
                      SizedBoxH(20),
                      HideFormMessage(),
                      SizedBoxH(20),
                      HideButton(),
                      SizedBox(height: 15),
                      HideResult(),
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }
}
