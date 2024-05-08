part of '_index.dart';

class SeekImageView extends StatelessWidget {
  const SeekImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: SeekImageAppbar(),
      ),
      floatingActionButton: const SeekImageFab(),
      body: Center(
        child: OnReactive(
          () => _dt.rxImageFile.st == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        _ct.pickImage();
                      },
                      child: const Text('Pick Image'),
                    ),
                    const SizedBoxH(20),
                    const Text('No Image Selected'),
                  ],
                )
              : Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 200,
                            child: Image.file(_dt.rxImageFile.st!),
                          ),
                          const SizedBoxH(20),
                          ElevatedButton(
                            onPressed: () {
                              _ct.revealMessage(context);
                            },
                            child: const Text('Share Image'),
                          ),
                          TextField(
                            controller: _dt.rxMessage.controller,
                            focusNode: _dt.rxMessage.focusNode,
                            readOnly: true,
                            onTap: null,
                            onEditingComplete: () => _dt.rxMessage.focusNode.unfocus(),
                            decoration: InputDecoration(
                              isDense: true,
                              alignLabelWithHint: true,
                              labelText: 'Message',
                              hintText: 'Enter the message you want to hide',
                              errorText: _dt.rxMessage.error,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
