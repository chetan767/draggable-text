import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:image_drag/constants.dart';
import 'package:image_drag/logic/bloc/draggable_bloc.dart';
import 'package:image_drag/ui/widgets/draggable_text.dart';

class TextImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: GestureDetector(
          onTapDown: (TapDownDetails details) {
            var x = details.globalPosition.dx;
            var y = details.globalPosition.dy;
            if (context.read<DraggableBloc>().state.change == false) {
              context
                  .read<DraggableBloc>()
                  .add(AddText(offset: details.localPosition));
            }
          },
          child: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 5,
                          color: context.watch<DraggableBloc>().state.color),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://assets-global.website-files.com/5e3c45dea042cf97f3689681/5e417cd336a72b06a86c73e7_Flutter-Tutorial-Header%402x.jpg"),
                          fit: BoxFit.cover)),
                ),
                context.watch<DraggableBloc>().state.change == true
                    ? DraggableText(
                        offset: context.watch<DraggableBloc>().state.offset)
                    : Container(),
                Positioned(
                  bottom: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MaterialColorPicker(
                        onColorChange: (Color color) {
                          context
                              .read<DraggableBloc>()
                              .add(ChangeBorderColor(color: color));
                        },
                        selectedColor:
                            context.watch<DraggableBloc>().state.color,
                        colors: const [
                          Colors.red,
                          Colors.deepOrange,
                          Colors.yellow,
                          Colors.lightGreen,
                          Colors.blue,
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 20,
                        child: Slider(
                            max: 100,
                            min: 10,
                            value:
                                context.watch<DraggableBloc>().state.font_size,
                            onChanged: (val) {
                              context
                                  .read<DraggableBloc>()
                                  .add(ChangeFontSize(font_size: val));
                            }),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
