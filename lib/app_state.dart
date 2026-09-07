import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_state.g.dart';

/// App state model holding state for the application.
class AppState {
  final String dummy;

  const AppState({
    this.dummy = 'initial dummy value',
  });

  AppState copyWith({
    String? dummy,
  }) {
    return AppState(
      dummy: dummy ?? this.dummy,
    );
  }

  @override
  String toString() => 'AppState(dummy: $dummy)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          dummy == other.dummy;

  @override
  int get hashCode => dummy.hashCode;
}

/// Riverpod 3.0 notifier managing [AppState].
@riverpod
class AppStateNotifier extends _$AppStateNotifier {
  @override
  AppState build() {
    return const AppState();
  }

  void updateDummy(String newDummy) {
    state = state.copyWith(dummy: newDummy);
  }
}
