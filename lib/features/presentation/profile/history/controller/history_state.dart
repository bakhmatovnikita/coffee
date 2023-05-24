import 'package:cofee/features/domain/entiti/default_history_entiti.dart/history_order_entiti.dart';
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
  final HistoryOrderEntiti historyEntiti;

  HistoryLoadedSatate(this.historyEntiti);
  @override
  List<Object?> get props => [historyEntiti];
}

class NotHaveItemState extends HistoryState {
  @override
  List<Object?> get props => [];
}

class HistoryErrorState extends HistoryState {
  final String message;

  HistoryErrorState({required this.message});
  @override
  List<Object?> get props => [];
}
