part of 'draggable_bloc.dart';

@immutable
abstract class DraggableEvent {}

class AddText extends DraggableEvent {
  final Offset offset;
  AddText({
    required this.offset,
  });
}

class ChangeFontSize extends DraggableEvent {
  final double font_size;
  ChangeFontSize({
    required this.font_size,
  });
}

class ChangeBorderColor extends DraggableEvent {
  final Color color;
  ChangeBorderColor({
    required this.color,
  });
}
