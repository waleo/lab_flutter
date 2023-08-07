import 'package:flutter/material.dart';
import 'pages/buttons_page.dart';
import 'pages/column_spaced_evenly_page.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
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

    final Map<int, Map<String, Object>> pageMap = {
      0: {'name': 'Buttons', 'object': const ButtonsPage()},
      1: {
        'name': 'Column Spaced Evenly',
        'object': const ColumnSpacedEvenlyPage()
      }
    };

    switch (selectedIndex) {
      case 0:
        page = pageMap[0]!['object'] as Widget;
        break;
      case 1:
        page = pageMap[1]!['object'] as Widget;
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
          destinations: [
            NavigationRailDestination(
                icon: const Icon(Icons.input),
                label: Text(pageMap[0]!['name'] as String)),
            NavigationRailDestination(
                icon: const Icon(Icons.circle),
                label: Text(pageMap[1]!['name'] as String))
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
