import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vgo_app/pages/commerce_page.dart';
import 'package:vgo_app/pages/community_page.dart';
import 'package:vgo_app/pages/government_page.dart';
import 'package:vgo_app/pages/transport_page.dart';

void main() {
  runApp(const VGOApp());
}

class VGOApp extends StatelessWidget {
  const VGOApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VGO - Local Community Services',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const CommerceAndTradePage(),
    const TransportAndDeliveryPage(),
    const GovernmentAndNGOPage(),
    const CommunityDevelopmentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('V.GO'),
        centerTitle: true,
        elevation: 0,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.store),
            label: 'Commerce',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_shipping),
            label: 'Transport',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance),
            label: 'Government',
          ),
          NavigationDestination(
            icon: Icon(Icons.people),
            label: 'Community',
          ),
        ],
      ),
    );
  }
}
