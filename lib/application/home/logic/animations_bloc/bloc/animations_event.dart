part of 'animations_bloc.dart';


abstract class AnimationsEvent {}

class AnimationsChangedEvent extends AnimationsEvent {
  BorderRadiusGeometry containerBorderRadius;
  Color containerColor;
  AnimationsChangedEvent({
    required this.containerBorderRadius,
    required this.containerColor,
  });
}
