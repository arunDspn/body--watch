import 'package:hydrated_bloc/hydrated_bloc.dart';

class CounterState {
  CounterState({this.value = 0});
  final int value;

  // Add copyWith method for convenience
  CounterState copyWith({int? value}) {
    return CounterState(value: value ?? this.value);
  }

  // Add toJson method to convert state to a map
  Map<String, dynamic> toJson() => {'value': value};

  // Add fromJson factory to create state from a map
  static CounterState fromJson(Map<String, dynamic> json) {
    return CounterState(value: json['value'] as int);
  }
}

class CounterBloc extends HydratedBloc<int, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<int>((event, emit) {
      emit(state.copyWith(value: state.value + event));
    });
  }

  // Implement toJson to convert state to a JSON map
  @override
  Map<String, dynamic>? toJson(CounterState state) => state.toJson();

  // Implement fromJson to create state from a JSON map
  @override
  CounterState fromJson(Map<String, dynamic> json) =>
      CounterState.fromJson(json);
}

//

  // del
  // @override
  // Stream<CounterState> mapEventToState(int event) async* {
  //   yield state.copyWith(value: state.value + event);
  // }