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
      home: const MyHomePage(title: 'Multi Page App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = const Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
        body: Row(
      children: [
        SafeArea(
            child: NavigationRail(
          extended: true,
          destinations: const [
            NavigationRailDestination(
                icon: Icon(Icons.home), label: Text('Buttons')),
            NavigationRailDestination(
                icon: Icon(Icons.favorite), label: Text('Page 2'))
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        )),
        Expanded(
            child: Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: page,
        ))
      ],
    ));
  }
}

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // appState.toggleFavorite();
                },
                icon: const Icon(Icons.abc),
                label: Text('Like'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // appState.getNext();
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
