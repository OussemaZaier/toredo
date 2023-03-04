import 'package:localstorage/localstorage.dart';

class Singleton {
  static final LocalStorage storage = new LocalStorage('todo_app');

  Future<LocalStorage> getStorage() async {
    await storage.ready;
    return storage;
  }
}
