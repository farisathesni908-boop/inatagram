abstract class ProfileEvent {}

class LoadProfile extends ProfileEvent {}
class FetchProfile extends ProfileEvent {
 
String user;
  FetchProfile({required this.user});
}