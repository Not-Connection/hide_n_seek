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
      body: Center(
        child: OnReactive(
          () => _dt.rxPickedFile.st == null
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
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Card(
                                    child: ListTile(
                                      leading: SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Image.file(
                                          File(_dt.rxPickedFile.st!.path),
                                        ),
                                      ),
                                      title: Text(
                                        _dt.rxPickedFile.st!.name,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      trailing: IconButton(
                                        onPressed: () {
                                          nav.toDialog(
                                            CupertinoAlertDialog(
                                              title: const Text('Confirmation'),
                                              content: const Text('Are you sure to delete this image?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    nav.back();
                                                  },
                                                  child: const Text('CANCEL'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    _dt.rxPickedFile.refresh();
                                                    nav.back();
                                                  },
                                                  child: const Text(
                                                    'DELETE',
                                                    style: TextStyle(color: Colors.red),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBoxH(20),
                                  const SteganographFormMessage(),
                                  const SizedBoxH(20),
                                  const SteganographHideMessage(),
                                  const SizedBox(height: 15),
                                  Visibility(
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
                                                    _ct.shareFile();
                                                  },
                                                ),
                                                const SizedBoxW(10),
                                                IconButton(
                                                  tooltip: 'Download Image',
                                                  icon: const Icon(Icons.download),
                                                  onPressed: () {},
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
        maxLines: 10,
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
          child: ElevatedButton.icon(
            icon: const Icon(Icons.lock),
            label: const Text('Hide Message'),
            onPressed: _dt.rxForm.isValid ? () => _ct.submit() : null,
          ),
        );
      },
    );
  }
}
