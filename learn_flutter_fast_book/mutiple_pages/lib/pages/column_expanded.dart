import "package:flutter/material.dart";

class ColumnExpandedPage extends StatelessWidget {
  const ColumnExpandedPage({super.key});

  @override
  Widget build(BuildContext context) {
    RawMaterialButton redButton = RawMaterialButton(
      constraints: const BoxConstraints(minWidth: 188.0, minHeight: 136.0),
      onPressed: () {},
      elevation: 2.0,
      fillColor: Colors.red,
      padding: const EdgeInsets.all(15.0),
    );
    RawMaterialButton greenButton = RawMaterialButton(
      constraints: const BoxConstraints(minWidth: 188.0, minHeight: 136.0),
      onPressed: () {},
      elevation: 2.0,
      fillColor: Colors.green,
      padding: const EdgeInsets.all(15.0),
    );
    RawMaterialButton blueButton = RawMaterialButton(
      constraints: const BoxConstraints(minWidth: 188.0, minHeight: 136.0),
      onPressed: () {},
      elevation: 2.0,
      fillColor: Colors.blue,
      padding: const EdgeInsets.all(15.0),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Column'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: redButton),
          Expanded(child: greenButton),
          Expanded(child: blueButton)
        ],
      )),
    );
  }
}
