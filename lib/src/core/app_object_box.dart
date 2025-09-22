import 'package:path_provider/path_provider.dart';
import 'package:recetas_aplazo/objectbox.g.dart';
import 'package:path/path.dart' as p;

late Store store;

class AppObjectBox {
  /// Create an instance of ObjectBox to use throughout the app.
  static Future<void> boot() async {
    final docsDir = await getApplicationDocumentsDirectory();
    store = await openStore(directory: p.join(docsDir.path));
  }
}
