// part of 'highlight_stories_bloc.dart';

// sealed class HighlightStoriesEvent {}

// class FetchHighlightStories extends HighlightStoriesEvent {
//   final String userId;

//   FetchHighlightStories(this.userId);
// }
part of 'highlight_stories_bloc.dart';

sealed class HighlightStoriesEvent {}

class FetchHighlightStories extends HighlightStoriesEvent {
 
String id;
  FetchHighlightStories({required this.id});
}