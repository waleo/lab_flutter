import 'package:flutter/material.dart';

class ButtonsPage extends StatefulWidget {
  const ButtonsPage({super.key});

  @override
  State<ButtonsPage> createState() => _ButtonsPageState();
}

class _ButtonsPageState extends State<ButtonsPage> {
  @override
  Widget build(BuildContext context) {
    List<String> dropdownValues = <String>['Mens', 'Womens', 'None'];

    String dropdownValue = dropdownValues.first;

    Row textButtonRow =
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      TextButton(
          onPressed: () => debugPrint('textbutton pressed'),
          child: const Text('TextButton')),
    ]);
    Row elevatedButtonRow =
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ElevatedButton(
          onPressed: () => debugPrint('ElevatedButton pressed'),
          child: const Text('ElevatedButton')),
    ]);
    Row iconButtonRow =
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => debugPrint('IconButton pressed')),
      const Text('IconButton'),
    ]);
    Row outlinedButtonRow =
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      OutlinedButton(
          onPressed: () => debugPrint('OutlinedButton pressed'),
          child: const Text('OutlinedButton')),
    ]);
    Row dropdownButtonRow =
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      DropdownButton(
        items: [
          DropdownMenuItem(
              value: dropdownValues[0], child: Text(dropdownValues[0])),
          DropdownMenuItem(
              value: dropdownValues[1], child: Text(dropdownValues[1])),
          DropdownMenuItem(
              value: dropdownValues[2], child: Text(dropdownValues[2]))
        ],
        onChanged: (String? value) => setState(() {
          dropdownValue = value!;
        }),
        value: dropdownValue,
      ),
      const Text('Dropdown Button')
    ]);
    Row backButtonRow = const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [BackButton(), Text('BackButton')]);

    Row closeButtonRow = const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [CloseButton(), Text('CloseButton')]);

    return Scaffold(
      appBar: AppBar(title: const Text('Buttons')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            textButtonRow,
            elevatedButtonRow,
            iconButtonRow,
            outlinedButtonRow,
            dropdownButtonRow,
            backButtonRow,
            closeButtonRow
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint('FloatingActionButton pressed'),
        child: const Text('F.A.B'),
      ),
    );
  }
}
