import 'package:flutter/material.dart';
import 'package:image_drag/constants.dart';
import 'package:image_drag/logic/bloc/draggable_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DraggableText extends StatefulWidget {
  final Offset offset;
  const DraggableText({
    Key? key,
    required this.offset,
  }) : super(key: key);

  @override
  _DraggableTextState createState() => _DraggableTextState();
}

class _DraggableTextState extends State<DraggableText> {
  Offset offset = Offset.zero;

  @override
  void initState() {
    offset = widget.offset;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy - 25,
      child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              offset = Offset(
                  offset.dx + details.delta.dx, offset.dy + details.delta.dy);
            });
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Enter Your Text Here",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  style: TextStyle(
                      fontSize: context.watch<DraggableBloc>().state.font_size),
                ),
              ),
            ),
          )),
    );
  }
}
