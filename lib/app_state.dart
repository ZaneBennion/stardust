import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_state.g.dart';

/// App state model holding state for the application.
class AppState {
  final int pageIndex;
  final String? selectedDirectory;

  const AppState({
    this.pageIndex = 0,
    this.selectedDirectory,
  });

  AppState copyWith({
    int? pageIndex,
    String? selectedDirectory,
    bool clearSelectedDirectory = false,
  }) {
    return AppState(
      pageIndex: pageIndex ?? this.pageIndex,
      selectedDirectory: clearSelectedDirectory
          ? null
          : (selectedDirectory ?? this.selectedDirectory),
    );
  }

  @override
  String toString() =>
      'AppState(pageIndex: $pageIndex, selectedDirectory: $selectedDirectory)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          pageIndex == other.pageIndex &&
          selectedDirectory == other.selectedDirectory;

  @override
  int get hashCode => Object.hash(pageIndex, selectedDirectory);
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

  void setSelectedDirectory(String? directoryPath) {
    state = state.copyWith(
      selectedDirectory: directoryPath,
      clearSelectedDirectory: directoryPath == null,
    );
  }
}
