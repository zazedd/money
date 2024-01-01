import '/auth/user_role.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'auth/supabase_auth/supabase_user_provider.dart';
import 'auth/supabase_auth/auth_util.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '/backend/supabase/supabase.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  await SupaFlow.initialize();

  await FlutterFlowTheme.initialize();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  userRole.role = prefs.getInt("userRole");
  print("main $userRole.role");

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late Stream<BaseAuthUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = moneySupabaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Money',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('pt'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scrollbarTheme: ScrollbarThemeData(),
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = userRole.role == 0
      ? 'homePageCEO'
      : (userRole.role == 1 ? 'homePageEmpreendedor' : 'homePageTrabalhador');
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      0: {
        'homePageCEO': HomePageCEOWidget(),
        'materiais': MateriaisWidget(),
        'profilePage': ProfilePageWidget(),
      },
      1: {
        'homePageEmpreendedor': HomePageEmpreendedorWidget(),
        'profilePage': ProfilePageWidget(),
      },
      2: {
        'homePageTrabalhador': HomePageTrabalhadorWidget(),
        'profilePage': ProfilePageWidget(),
      },
    };

    final userTabs = tabs[userRole.role] ?? tabs[2];
    int currentIndex = userTabs?.keys.toList().indexOf(_currentPageName) ?? 0;
    if (currentIndex == -1) currentIndex = 0;

    print(userRole.role);
    print('currentIndex: $currentIndex');
    print('keys: ${userTabs?.keys.toList()}');
    print('_currentPageName: $_currentPageName');

    return Scaffold(
      body: _currentPage ?? userTabs?[_currentPageName],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() {
          _currentPage = null;
          _currentPageName = userTabs?.keys.toList()[i] ?? 'materiais';
        }),
        backgroundColor: Color(0xFF181818),
        selectedItemColor: Color(0xFF1ED3D3),
        unselectedItemColor: Color(0xFFB2B2B2),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: userTabs?.entries.map((entry) {
              final key = entry.key;
              return BottomNavigationBarItem(
                icon: getIcon(key),
                activeIcon: getActiveIcon(key),
                label: key == 'profilePage'
                    ? 'Perfil'
                    : key == 'materiais'
                        ? 'Materiais'
                        : 'Home',
                tooltip: '',
              );
            }).toList() ??
            [
              BottomNavigationBarItem(
                  icon: getIcon('homePageTrabalhador'),
                  activeIcon: getActiveIcon('homePageTrabalhador'),
                  label: 'Home')
            ],
      ),
    );
  }

  // Helper functions to get icons based on the page name
  Icon getIcon(String pageName) {
    switch (pageName) {
      case 'materiais':
        return Icon(
          Icons.handyman_sharp,
          size: 22.0,
        );
      case 'profilePage':
        return Icon(
          Icons.account_circle_outlined,
          size: 24.0,
        );
      default:
        return Icon(
          Icons.home_outlined,
          size: 24.0,
        );
    }
  }

  Icon getActiveIcon(String pageName) {
    switch (pageName) {
      case 'materiais':
        return Icon(
          Icons.handyman_sharp,
          size: 22.0,
        );
      case 'profilePage':
        return Icon(
          Icons.account_circle_outlined,
          size: 24.0,
        );
      default:
        return Icon(
          Icons.home_rounded,
          size: 24.0,
        );
    }
  }
}
