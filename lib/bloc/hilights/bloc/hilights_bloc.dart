import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hilights_event.dart';
part 'hilights_state.dart';

class HilightsBloc extends Bloc<HilightsEvent, HilightsState> {
  HilightsBloc() : super(HilightsInitial()) {
    on<HilightsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
