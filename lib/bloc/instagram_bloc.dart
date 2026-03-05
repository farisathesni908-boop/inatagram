import 'package:flutter_bloc/flutter_bloc.dart';
import '../Repository/Api/Instagram_api.dart';
import 'instagram_event.dart';
import 'instagram_state.dart';

class InstagramBloc extends Bloc<InstagramEvent, InstagramState> {
  final InstagramApi api = InstagramApi();

  InstagramBloc() : super(InstagramInitial()) {

    on<FetchInstagram>((event, emit) async {
      emit(InstagramLoading());

      try {
        final data = await api.fetchData(event.user); // return InstagramModel
        emit(InstagramLoaded(data));
      } catch (e) {
        emit(InstagramError(e.toString()));
      }
    });

  }
}
