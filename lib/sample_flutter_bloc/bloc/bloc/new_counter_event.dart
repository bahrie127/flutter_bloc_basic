part of 'new_counter_bloc.dart';

@immutable
sealed class NewCounterEvent {}

class Increment extends NewCounterEvent {}

class Decrement extends NewCounterEvent {}
