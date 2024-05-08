part of '_index.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: HomeAppbar(),
      ),
      // floatingActionButton: HomeFab(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => nav.to(Routes.hide),
              child: const Text(
                "Hide",
              ),
            ),
            ElevatedButton(
              onPressed: () => nav.to(Routes.seek),
              child: const Text(
                "Seek",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
