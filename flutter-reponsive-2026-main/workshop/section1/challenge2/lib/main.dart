import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdaptiveNavPage(),
    );
  }
}

class AdaptiveNavPage extends StatefulWidget {
  const AdaptiveNavPage({super.key});

  @override
  State<AdaptiveNavPage> createState() => _AdaptiveNavPageState();
}

class _AdaptiveNavPageState extends State<AdaptiveNavPage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    Center(child: Text('Home Screen', style: TextStyle(fontSize: 24))),
    Center(child: Text('Settings Screen', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isSmallScreen = constraints.maxWidth < 600;

        return Scaffold(
          appBar: AppBar(title: const Text('Adaptive Navigation')),
          body: isSmallScreen
              ? pages[selectedIndex]
              : Row(
                  children: [
                    NavigationRail(
                      selectedIndex: selectedIndex,
                      onDestinationSelected: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      labelType: NavigationRailLabelType.all,
                      destinations: const [
                        NavigationRailDestination(
                          icon: Icon(Icons.home),
                          label: Text('Home'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.settings),
                          label: Text('Settings'),
                        ),
                      ],
                    ),
                    const VerticalDivider(thickness: 1, width: 1),
                    Expanded(child: pages[selectedIndex]),
                  ],
                ),
          bottomNavigationBar: isSmallScreen
              ? BottomNavigationBar(
                  currentIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                )
              : null,
        );
      },
    );
  }
}
