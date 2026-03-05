import 'package:instagram/Repository/Model/Profile_Model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final InstagramProfileModel data;

  ProfileLoaded(this.data);
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}