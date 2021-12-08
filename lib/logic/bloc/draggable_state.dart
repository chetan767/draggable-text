part of 'draggable_bloc.dart';

class DraggableState {
  Offset offset;
  bool change;
  double font_size;
  Color color;
  DraggableState(
      {required this.offset,
      this.change = false,
      this.font_size = 30.0,
      this.color = Colors.red});

  DraggableState copyWith({
    Offset? offset,
    bool? change,
    double? font_size,
    Color? color,
  }) {
    return DraggableState(
      offset: offset ?? this.offset,
      change: change ?? this.change,
      font_size: font_size ?? this.font_size,
      color: color ?? this.color,
    );
  }
}
