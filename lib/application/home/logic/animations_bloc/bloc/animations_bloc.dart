import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/utils.dart';

part 'animations_event.dart';
part 'animations_state.dart';

class AnimationsBloc extends Bloc<AnimationsEvent, AnimationsState> {
  AnimationsBloc() : super(AnimationsState(containerBorderRadius:  BorderRadius.circular(0),containerColor:  AppColors.darkBlueColor)) {
    on<AnimationsChangedEvent>((event, emit) {
      emit(AnimationsState(containerColor: event.containerColor, containerBorderRadius: event.containerBorderRadius));
    });
  }
}
