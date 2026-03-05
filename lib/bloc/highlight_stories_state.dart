


import 'package:instagram/Repository/Model/highlightStories.dart';

 class HighlightStoriesState {}

 class HighlightStoriesInitial extends HighlightStoriesState {}
class HighlightStoriesloading extends HighlightStoriesState{}
class HighlightStoriesloaded extends HighlightStoriesState{
  final HighlightStoriesModel data;
HighlightStoriesloaded(this.data);

}
class HighlightStoriesError extends HighlightStoriesState{
  final String message;
  HighlightStoriesError(this.message);
}