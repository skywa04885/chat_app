import 'package:flutter/cupertino.dart';
import 'package:lukerieff/entities/UserEntity.dart';

class MeProvider extends ChangeNotifier {
  UserEntity? _me;

  UserEntity get me {
    return _me!;
  }

  set me(final UserEntity? me) {
    _me = me;

    notifyListeners();
  }

  bool hasMe() {
    return _me != null;
  }
}
