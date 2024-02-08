import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_page_controller.g.dart';

@riverpod
class ShowDownloads extends _$ShowDownloads {
  @override
  bool build() {
    return kIsWeb;
  }

  void toggleDownloads() {
    state = !state;
  }
}
