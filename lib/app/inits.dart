part of '_index.dart';

Future<void> inits() async {
  logx.wtf('inits start');
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Serv.sample.init();

  Serv.steganograph.init();
  logx.wtf('inits success');
  FlutterNativeSplash.remove();
}
