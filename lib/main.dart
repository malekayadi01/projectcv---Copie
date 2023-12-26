import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projectcv/pages/activities_page.dart';
import 'package:projectcv/pages/education_page.dart';
import 'package:projectcv/pages/objective_page.dart';
import 'package:projectcv/pages/personal_info_page.dart';
import 'package:projectcv/pages/work_experience_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../pages/theme.dart'; // Create a separate file for the theme

import 'Splash/splach.screen.dart';
import 'l10n/l10n.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'My Resume App',
          theme: themeProvider.getTheme(),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          locale: const Locale('ar'),
          supportedLocales: L10n.all,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        );
      },
    );
  }
}

class MyResumeApp extends StatefulWidget {
  @override
  _MyResumeAppState createState() => _MyResumeAppState();
}

class _MyResumeAppState extends State<MyResumeApp> {
  String _currentPageName = 'Personal Info';

  void updatePageTitle(String pageTitle) {
    setState(() {
      _currentPageName = pageTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: _currentPageName,
          theme: themeProvider.getTheme(),
          home: ResumePage(updatePageTitle: updatePageTitle),
        );
      },
    );
  }
}

class ResumePage extends StatefulWidget {
  final Function(String) updatePageTitle;

  const ResumePage({Key? key, required this.updatePageTitle}) : super(key: key);

  @override
  _ResumePageState createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
            widget.updatePageTitle(_getCurrentPageTitle());
          });
        },
        children: [
          WorkExperiencePage(),
          PersonalInfoPage(),
          EducationPage(),
          ObjectivePage(),
          ActivitiesPage(),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey[400],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label:AppLocalizations.of(context)!.personalInfo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label:AppLocalizations.of(context)!.skills,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label:AppLocalizations.of(context)!.education,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label:AppLocalizations.of(context)!.workExperience,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label:AppLocalizations.of(context)!.settings,
          ),
        ],
      ),
    );
  }

  String _getCurrentPageTitle() {
    switch (_currentIndex) {
      case 0:
        return 'Personal Info';
      case 1:
        return 'skills';
      case 2:
        return 'Education';
      case 3:
        return 'Work Experience';
      case 4:
        return 'Activities';
      default:
        return 'My Resume App';
    }
  }
}
