part of 'text_home_bloc.dart';

@immutable
abstract class TextHomeEvent {}

class TextHomeTypedEvent extends TextHomeEvent {
  final String text;
  TextHomeTypedEvent({
    required this.text,
  });
}

class TextHomeClearedEvent extends TextHomeEvent {}
