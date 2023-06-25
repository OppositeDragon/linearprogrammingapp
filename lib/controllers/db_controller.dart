import 'package:hive_flutter/adapters.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'db_controller.g.dart';

const String loginBox = 'loginBox';
const String userKey = 'userKey';

@riverpod
Box dbLogin(DbLoginRef ref) {
  return Hive.box(loginBox);
}
