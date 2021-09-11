import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_calc/screens/main_page.dart';
import 'package:pizza_calc/services/general_services.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GeneralServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GeneralServices>.value(
      value: GeneralServices(),
      builder: (context, _) {
        final model = Provider.of<GeneralServices>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: model.themeMode,
          darkTheme: ThemeData(
              brightness: Brightness.dark,
              textTheme: GoogleFonts.robotoMonoTextTheme(),
              primaryColor: Colors.black,
              backgroundColor: Colors.white),
          theme: ThemeData(
            brightness: Brightness.light,
            textTheme: GoogleFonts.robotoMonoTextTheme(),
            primaryColor: Colors.white,
            backgroundColor: Colors.black,
          ),
          home: const MainPage(),
        );
      },
    );
  }
}
