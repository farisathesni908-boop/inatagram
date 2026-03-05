part of 'hilights_bloc.dart';

@immutable
sealed class HilightsState {}

final class HilightsInitial extends HilightsState {}

class HilightsLoading extends HilightsState {}

class HilightsLoaded extends HilightsState {}

class HilightsError extends HilightsState {}


