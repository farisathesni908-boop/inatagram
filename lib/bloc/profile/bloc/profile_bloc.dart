// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:instagram/Repository/Api/Profile_Api.dart';


// // import 'package:instagram/bloc/profile/bloc/profile_event.dart';
// // import 'package:instagram/bloc/profile/bloc/profile_state.dart';


// // class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
// //   final ProfileApi api = ProfileApi();

// //   ProfileBloc() : super(profileInitial()) {

// //     on<Loadproflile>((event, emit) async {
// //       emit(profileLoading());

// //       try {
// //         final data = await api.fetchData(); 
// //         emit(profileLoaded(data.));
// //       } catch (e) {
// //         emit(profileError(e.toString()));
// //       }
// //     });

// //   }
// // }
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:instagram/Repository/Api/Profile_Api.dart';
// // import 'package:instagram/bloc/profile/bloc/profile_event.dart';
// // import 'package:instagram/bloc/profile/bloc/profile_state.dart';

// // class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
// //   final ProfileApi api = ProfileApi();

// //   ProfileBloc() : super(profileInitial()) {

// //     on<Loadproflile>((event, emit) async {
// //       emit(profileLoading());

// //       try {
// //         final data = await api.fetchData();

// //         if (data.result != null) {
// //           emit(profileLoaded(data));
// //         } else {
// //           emit(profileError("Profile data is empty"));
// //         }

// //       } catch (e) {
// //         emit(profileError(e.toString()));
// //       }
// //     });

// //   }
// // }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Repository/Api/Profile_Api.dart';

import 'package:instagram/bloc/profile/bloc/profile_event.dart';
import 'package:instagram/bloc/profile/bloc/profile_state.dart';


class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileApi api = ProfileApi();

  ProfileBloc() : super(ProfileInitial ()) {

    on<FetchProfile>((event, emit) async {
      emit(ProfileLoading());

      try {
        final data = await api.fetchData(event.user);

        if (data.result != null) {
          emit(ProfileLoaded( data));
        } else {
          emit(ProfileError("Profile data is empty"));
        }

      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });

  }
}
