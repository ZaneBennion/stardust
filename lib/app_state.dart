import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_state.g.dart';

/// App state model holding state for the application.
class AppState {
  final int pageIndex;

  const AppState({
    this.pageIndex = 0,
  });

  AppState copyWith({
    int? pageIndex,
  }) {
    return AppState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  @override
  String toString() => 'AppState(pageIndex: $pageIndex)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          pageIndex == other.pageIndex;

  @override
  int get hashCode => pageIndex.hashCode;
}

/// Riverpod 3.0 notifier managing [AppState].
@riverpod
class AppStateNotifier extends _$AppStateNotifier {
  @override
  AppState build() {
    return const AppState();
  }

  void setPageIndex(int newIndex) {
    state = state.copyWith(pageIndex: newIndex);
  }
}
