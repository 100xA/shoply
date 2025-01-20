import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'welcome_provider.g.dart';

@riverpod
class Welcome extends _$Welcome {
  static const _key = 'is_first_time_user';

  @override
  Future<bool> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? true;
  }

  Future<void> markWelcomeAsSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, false);
    state = const AsyncValue.data(false);
  }
}
