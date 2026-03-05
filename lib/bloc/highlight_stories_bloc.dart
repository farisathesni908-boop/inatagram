import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Repository/Api/stories_api.dart';
import 'package:instagram/bloc/highlight_stories_state.dart';

part 'highlight_stories_event.dart';

class HighlightStoriesBloc
    extends Bloc<HighlightStoriesEvent, HighlightStoriesState> {

  final StoriesApi api = StoriesApi();

  HighlightStoriesBloc() : super(HighlightStoriesInitial()) {

    on<FetchHighlightStories>((event, emit) async {

      emit(HighlightStoriesloading());

      try {
        final data = await api.fetchData(event.id);

        if (data.result != null) {
          emit(HighlightStoriesloaded(data));
        } else {
          emit(HighlightStoriesError("Highlight stories data is empty"));
        }

      } catch (e) {
        emit(HighlightStoriesError(e.toString()));
      }

    });

  }
}