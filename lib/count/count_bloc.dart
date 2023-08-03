import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'count_event.dart';
part 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  CountBloc() : super(IncreaseCountState(0)) {
    on<ChangeCountEvent>((event, emit) {
      emit(IncreaseCountState(event.count));
    });
  }
}
