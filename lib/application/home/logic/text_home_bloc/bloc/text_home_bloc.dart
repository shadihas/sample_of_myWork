import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'text_home_event.dart';
part 'text_home_state.dart';

class TextHomeBloc extends Bloc<TextHomeEvent, TextHomeState> {
  TextHomeBloc() : super(const TextHomeState(text: "")) {
    on<TextHomeTypedEvent>((event, emit) {
      emit(TextHomeState(text: event.text));
    });

    on<TextHomeClearedEvent>((event, emit) {
      emit(const TextHomeState(text: ""));
    });
  }
}
