import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app/_index.dart';

void main() async {
  //todo: uncomment line below to init repo.mock files
  // await Mocks.instance.init();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await inits();

  FlutterNativeSplash.remove();

  runApp(const App());
}
