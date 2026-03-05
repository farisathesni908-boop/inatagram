abstract class InstagramEvent {}

class LoadInstagram extends InstagramEvent {}
class FetchInstagram extends InstagramEvent {
 
String user;
  FetchInstagram({required this.user});
}