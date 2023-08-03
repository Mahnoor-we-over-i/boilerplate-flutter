part of 'count_bloc.dart';

@immutable
abstract class CountState {}

class IncreaseCountState extends CountState {
  final int count;
  IncreaseCountState(this.count);
}
