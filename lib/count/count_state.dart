part of 'count_bloc.dart';

abstract class CountState {}

class IncreaseCountState extends CountState {
  final int count;
  IncreaseCountState(this.count);
}
