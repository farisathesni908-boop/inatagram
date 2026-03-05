part of 'highlights_bloc.dart';

@immutable
sealed class HighlightsEvent {}
class loadHighlights extends HighlightsEvent{}
class FetchHighlights extends HighlightsEvent {
 
String user;
  FetchHighlights({required this.user});
}