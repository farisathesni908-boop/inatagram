import 'package:bloc/bloc.dart';
import 'package:instagram/Repository/Api/hielightsapi.dart';
import 'package:instagram/Repository/Model/highlightsmodel.dart';
import 'package:meta/meta.dart';

part 'highlights_event.dart';
part 'highlights_state.dart';

class HighlightsBloc extends Bloc<HighlightsEvent, HighlightsState>{
 
  final Hielightsapi api = Hielightsapi();

  HighlightsBloc() : super(HighlightsInitial()) {
    on<FetchHighlights>((event, emit) async{
      emit(Highlightsloading());
      try{
        final data= await api.fetchData(event.user);
        emit(Highlightsloaded(data));
      }catch(e){
        emit(HighlightSError(e.toString()));
      }
      // TODO: implement event handler
    });
  }
  

}



