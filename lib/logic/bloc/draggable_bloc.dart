import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'draggable_event.dart';
part 'draggable_state.dart';

class DraggableBloc extends Bloc<DraggableEvent, DraggableState> {
  DraggableBloc()
      : super(DraggableState(
          offset: Offset.zero,
        ));

  @override
  Stream<DraggableState> mapEventToState(
    DraggableEvent event,
  ) async* {
    if (event is AddText) {
      yield state.copyWith(offset: event.offset, change: true);
    } else if (event is ChangeFontSize) {
      yield state.copyWith(font_size: event.font_size);
    } else if (event is ChangeBorderColor) {
      yield state.copyWith(color: event.color);
    }
  }
}
