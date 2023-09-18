import "package:flutter/material.dart";

class RowMainAxisAlignmentPage extends StatelessWidget {
  const RowMainAxisAlignmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Row Main Axis Alignment')),
        body: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('MainAxisAlignment'),
                Text(' is'),
                Text(' center')
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text('MainAxisAlignment'),
                Text(' is'),
                Text(' end')
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text('MainAxisAlignment'),
                Text(' is'),
                Text(' space around')
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('MainAxisAlignment'),
                Text(' is'),
                Text(' space'),
                Text(' between')
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Text('MainAxisAlignment'),
                Text(' is'),
                Text(' space'),
                Text(' evenly')
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text('MainAxisAlignment'),
                Text(' is'),
                Text(' start'),
              ]),
            ]));
  }
}
