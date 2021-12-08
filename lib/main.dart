import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_drag/logic/bloc/draggable_bloc.dart';
import 'package:image_drag/ui/screens/text_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DraggableBloc>(
      create: (context) => DraggableBloc(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: TextImage(),
      ),
    );
  }
}
