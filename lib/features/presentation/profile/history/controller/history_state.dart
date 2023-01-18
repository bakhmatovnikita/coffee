import 'package:cofee/features/domain/entiti/history/history_entiti.dart';
import 'package:equatable/equatable.dart';

class HistoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HistoryEmptyState extends HistoryState {
  @override
  List<Object?> get props => [];
}

class HistoryLoadedSatate extends HistoryState {
  final HistoryEntiti historyEntiti;

  HistoryLoadedSatate(this.historyEntiti);
  @override
  List<Object?> get props => [historyEntiti];
}

class HistoryErrorState extends HistoryState {
  final String message;

  HistoryErrorState({required this.message});
  @override
  List<Object?> get props => [];
}
