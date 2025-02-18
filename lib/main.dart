import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vgo_app/pages/login_page.dart';
import 'package:vgo_app/pages/commerce_page.dart';
import 'package:vgo_app/pages/transport_page.dart';
import 'package:vgo_app/pages/government_page.dart';
import 'package:vgo_app/pages/community_page.dart';
import 'package:vgo_app/pages/profile_page.dart';
import 'package:vgo_app/providers/theme_provider.dart';

void main() {

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const VGOApp(),
    ),
  );
}

class VGOApp extends StatelessWidget {
  const VGOApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'VGO - Local Community Services',
          themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green,
              brightness: Brightness.light,
            ),
            useMaterial3: true,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
            textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
          ),
          home: const LoginPage(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  final String userEmail;
  
  const HomePage({
    super.key,
    required this.userEmail,
  });

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
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(userEmail: widget.userEmail),
                ),
              );
            },
          ),
        ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Opening emergency services...')),
          );
        },
        tooltip: 'Open emergency services',
          child: LayoutBuilder(builder: (context, constraint) {
            return Icon(CupertinoIcons.exclamationmark, size: constraint.biggest.height * 0.6);
          }),
      ),
    );
  }
}
