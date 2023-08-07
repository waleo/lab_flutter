import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      DropdownButton(items: const [
        DropdownMenuItem(value: 'Mens', child: Text('Mens')),
        DropdownMenuItem(value: 'Womens', child: Text('Womens')),
        DropdownMenuItem(value: 'None', child: Text('None'))
      ], onChanged: (value) => debugPrint('Changed: $value')),
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
