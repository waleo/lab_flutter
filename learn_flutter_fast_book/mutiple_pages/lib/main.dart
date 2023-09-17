import 'package:flutter/material.dart';
import 'pages/buttons_page.dart';
import 'pages/column_spaced_evenly_page.dart';
import 'pages/column_expanded.dart';

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
      0: {
        'name': 'Buttons',
        'icon': const Icon(Icons.input),
        'object': const ButtonsPage()
      },
      1: {
        'name': 'Column Spaced Evenly',
        'icon': const Icon(Icons.circle),
        'object': const ColumnSpacedEvenlyPage()
      },
      2: <String, Object>{
        'name': 'Column Expanded',
        'icon': const Icon(Icons.wc),
        'object': const ColumnExpandedPage()
      }
    };

    page = pageMap[selectedIndex]!['object'] as Widget;

    List<NavigationRailDestination> navDestinations = [];
    for (var properties in pageMap.values) {
      navDestinations.add(NavigationRailDestination(
          icon: properties['icon'] as Icon,
          label: Text(properties['name'] as String)));
    }

    return Scaffold(
        body: Row(
      children: [
        SafeArea(
            child: NavigationRail(
          extended: true,
          destinations: navDestinations,
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
