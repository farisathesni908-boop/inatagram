import '../Repository/Model/Instagram_model.dart';

abstract class InstagramState {}

class InstagramInitial extends InstagramState {}

class InstagramLoading extends InstagramState {}

class InstagramLoaded extends InstagramState {
  final InstagramModel data;

  InstagramLoaded(this.data);
}

class InstagramError extends InstagramState {
  final String message;

  InstagramError(this.message);
}
