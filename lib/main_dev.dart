import 'package:immersion/flavors.dart';
import 'package:immersion/main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.dev;
  await runner.main();
}
