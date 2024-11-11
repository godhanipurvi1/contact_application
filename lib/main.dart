import 'package:app_contect/porivider/homeprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'android_/detail_page.dart';
import 'android_/homepage.dart';
import 'android_/intropage.dart';
import 'android_/privatepage.dart';
import 'android_/splashscreen.dart';
import 'ios/screens/ios_detail.dart';
import 'ios/screens/ios_home.dart';
import 'ios/screens/ios_stepper.dart';
import 'ios/screens/private_page.dart';
import 'model/modelcontect.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (context) => HomepageProvider(),
        // ),
        ChangeNotifierProvider(
          create: (context) => ContactsProvider(),
        ),
        // Add other providers as needed
        // Provider<MySharedPreferences>(
        //   create: (context) => MySharedPreferences(),
        // ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactsProvider>(
      builder: (context, provider, child) {
        return provider.isanroid
            ? MaterialApp(
                debugShowCheckedModeBanner: false,
                routes: {
                  '/splash': (context) => SplashScreen(),
                  '/intro': (context) => IntroPage(),
                  '/': (context) => HomePage(),
                  '/detailpage': (context) => StepperExample(),
                  '/private': (context) => PrivatePage(),
                  '/details': (context) => DetailsPage(),
                },
                //  home: HomePage(),
              )
            : CupertinoApp(
                debugShowCheckedModeBanner: false,
                //initialRoute: '/home',
                routes: {
                  // '/splash': (context) => SplashScreen(),
                  // '/intro': (context) => IntroPage(),
                  '/': (context) => homepage_i(),
                  '/detail': (context) => StepperExample_i(),
                  '/Detailspage': (context) => DetailsPage_i(),

                  '/private': (context) => privatepage_i(),
                },
                //  home: homepage_i(),
              );
      },
    );
  }
}

class StepperExample extends StatefulWidget {
  @override
  _StepperExampleState createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _currentStep = 0;

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController contectcontroller = TextEditingController();

  List<Step> _steps() => [
        Step(
          title: Text('Step 1'),
          content: Column(
            children: [
              Text('Enter your name:'),
              TextField(
                controller: namecontroller,
              ),
            ],
          ),
          isActive: _currentStep == 0,
        ),
        Step(
          title: Text('Step 2'),
          content: Column(
            children: [
              Text('Enter your email:'),
              TextField(controller: emailcontroller),
            ],
          ),
          isActive: _currentStep == 1,
        ),
        Step(
          title: Text('Step 3'),
          content: Column(
            children: [
              Text('Enter your contect:'),
              TextField(
                controller: contectcontroller,
              ),
            ],
          ),
          isActive: _currentStep == 2,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stepper(
            currentStep: _currentStep,
            onStepContinue: () {
              if (_currentStep < _steps().length - 1) {
                setState(() {
                  _currentStep += 1;
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Completed!')),
                );
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() {
                  _currentStep -= 1;
                });
              }
            },
            steps: _steps(),
          ),
          ElevatedButton(
            onPressed: () {
              String name = namecontroller.text;
              String email = emailcontroller.text;
              String contect = contectcontroller.text;

              Contact newcontect =
                  Contact(name: name, email: email, contact: contect);
              context.read<ContactsProvider>().addcontect(newcontect);
            },
            child: Text("save"),
          ),
        ],
      ),
    );
  }
}
