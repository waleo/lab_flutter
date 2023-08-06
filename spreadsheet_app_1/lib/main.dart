import 'package:flutter/material.dart';

void main() {
  runApp(SpreadsheetApp());
}

class SpreadsheetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SpreadsheetScreen(),
    );
  }
}

class SpreadsheetScreen extends StatefulWidget {
  @override
  _SpreadsheetScreenState createState() => _SpreadsheetScreenState();
}

class _SpreadsheetScreenState extends State<SpreadsheetScreen> {
  List<SpreadsheetRow> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spreadsheet App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return SpreadsheetRowWidget(
                  row: data[index],
                  onColumn1Changed: (value) =>
                      setState(() => data[index].column1 = value),
                  onColumn2Changed: (value) =>
                      setState(() => data[index].column2 = value),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => setState(
                () => data.add(SpreadsheetRow(column1: '', column2: ''))),
            child: Text('Add Row'),
          ),
        ],
      ),
    );
  }
}

class SpreadsheetRow {
  String column1;
  String column2;

  SpreadsheetRow({required this.column1, required this.column2});
}

class SpreadsheetRowWidget extends StatelessWidget {
  final SpreadsheetRow row;
  final ValueChanged<String> onColumn1Changed;
  final ValueChanged<String> onColumn2Changed;

  SpreadsheetRowWidget({
    required this.row,
    required this.onColumn1Changed,
    required this.onColumn2Changed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: onColumn1Changed,
              decoration: InputDecoration(labelText: 'Column 1'),
              controller: TextEditingController(text: row.column1),
            ),
          ),
          Expanded(
            child: TextField(
              onChanged: onColumn2Changed,
              decoration: InputDecoration(labelText: 'Column 2'),
              controller: TextEditingController(text: row.column2),
            ),
          ),
        ],
      ),
    );
  }
}
