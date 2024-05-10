part of '../_index.dart';

class SeekPickedImageTile extends StatelessWidget {
  const SeekPickedImageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
        onTap: () => _ct.showImagePreview(_dt.rxPickedFile.st!.name, _dt.rxPickedFile.st!.path),
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
    );
  }
}
