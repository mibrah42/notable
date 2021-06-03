import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notable/models/note.dart';
import 'package:notable/screens/add_note_screen.dart';
import 'package:notable/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  runApp(Notable());
}

class Notable extends StatelessWidget {
  const Notable({Key? key}) : super(key: key);

  Future<void> example() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('key', 'value');
    String? value = prefs.getString('key');
    print(value); // value
    prefs.remove('key');
  }

  @override
  Widget build(BuildContext context) {
    example();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AddNoteScreen.id: (context) => AddNoteScreen(),
      },
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: kDarkGrey,
          centerTitle: false,
          elevation: 0,
        ),
        scaffoldBackgroundColor: kDarkGrey,
      ),
      home: FutureBuilder(
        future: Hive.openBox('notes'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Handle error
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text("An error occurred"),
                ),
              );
            }
            return HomeScreen();
          }

          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
