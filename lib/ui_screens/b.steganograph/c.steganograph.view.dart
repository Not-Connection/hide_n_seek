part of '_index.dart';

class SteganographView extends StatelessWidget {
  const SteganographView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: SteganographAppbar(),
      ),
      // floatingActionButton: const SteganographFab(),
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
                        child: OnFormBuilder(
                          listenTo: _dt.rxForm,
                          builder: () {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 200,
                                  child: Image.file(_dt.rxImageFile.st!),
                                ),
                                const SizedBoxH(20),
                                const SteganographFormMessage(),
                                const SizedBox(height: 20),
                                const SteganographHideMessage(),
                                const SizedBox(height: 15),
                                ElevatedButton(
                                  onPressed: () => _ct.revealMessage(context),
                                  child: const Text('Reveal Message'),
                                ),
                                const SizedBox(height: 20),
                                if (_dt.rxHiddenMessage.st.isNotEmpty)
                                  Text('Hidden message: ${_dt.rxHiddenMessage.st}'),
                              ],
                            );
                          },
                        )),
                  ),
                ),
        ),
      ),
    );
  }
}

class SteganographFormMessage extends StatelessWidget {
  const SteganographFormMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: _dt.rxForm,
      builder: () => TextField(
        controller: _dt.rxMessage.controller,
        focusNode: _dt.rxMessage.focusNode,
        onEditingComplete: () => _dt.rxMessage.focusNode.unfocus(),
        decoration: InputDecoration(
          isDense: true,
          alignLabelWithHint: true,
          labelText: 'Message',
          hintText: 'Enter the message you want to hide',
          errorText: _dt.rxMessage.error,
        ),
      ),
    );
  }
}

class SteganographHideMessage extends StatelessWidget {
  const SteganographHideMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: _dt.rxForm,
      builder: () {
        return OnFormSubmissionBuilder(
          listenTo: _dt.rxForm,
          onSubmitting: () => const CircularProgressIndicator(),
          child: ElevatedButton(
            onPressed: _dt.rxForm.isValid ? () => _ct.submit() : null,
            child: const Text('Hide Message'),
          ),
        );
      },
    );
  }
}
