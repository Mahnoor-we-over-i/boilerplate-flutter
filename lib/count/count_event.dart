part of 'count_bloc.dart';

class CountEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeCountEvent extends CountEvent {
  @override
  List<Object> get props => [];
  int count;
  ChangeCountEvent(this.count);
}
