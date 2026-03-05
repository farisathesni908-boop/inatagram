part of 'highlights_bloc.dart';

@immutable
sealed class HighlightsState {}

final class HighlightsInitial extends HighlightsState {}
class Highlightsloading extends HighlightsState{}
class Highlightsloaded extends HighlightsState{
  final Hielightsmodel data;
Highlightsloaded(this.data);

}
class HighlightSError extends HighlightsState{
  final String message;
  HighlightSError(this.message);
}