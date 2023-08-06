import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class TextBlock {
  final Color _color;
  final String _text;

  TextBlock(this._color, this._text);

  String get text => _text;

  Color get color => _color;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  final List<TextBlock> textBlocks = [
    TextBlock(Colors.red, 'every'),
    TextBlock(Colors.redAccent, ' schoolboy'),
    TextBlock(Colors.green, '\nknows'),
    TextBlock(Colors.greenAccent, ' who'),
    TextBlock(Colors.blue, '\nimprisoned'),
    TextBlock(Colors.blueAccent, '\nMontezuma')
  ];

  void _incrementCounter() {
    setState(() {
      if (_index < textBlocks.length) {
        _index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<TextSpan> textSpans = <TextSpan>[];
    for (var i = 0; i < _index; i++) {
      TextBlock textBlock = textBlocks[i];
      textSpans.add(TextSpan(
          text: textBlock.text,
          style: TextStyle(color: textBlock.color, fontSize: 32.0)));
    }

    return new Scaffold(
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [Text.rich(TextSpan(children:textSpans))],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.note_add),
      ),
    );
  }
}
