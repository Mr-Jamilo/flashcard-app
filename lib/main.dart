import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:temp_app/models/collection.dart';
import 'package:temp_app/pages/cards_page.dart';
import 'package:temp_app/pages/card_editor_page.dart';
import 'package:temp_app/pages/flashcard_page.dart';
import 'package:temp_app/pages/settings_page.dart';
import 'package:temp_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'pages/decks_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Collection.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Collection()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DecksPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/decks': (context) => const DecksPage(),
        '/cards': (context) => const CardsPage(),
        '/settings': (context) => const SettingsPage(),
        '/card-editor': (context) {
          final passedCardID =
              ModalRoute.of(context)?.settings.arguments as int? ?? -1;
          return CardEditorPage(cardID: passedCardID);
        },
        '/flashcard': (context) {
          final passedDeckID =
              ModalRoute.of(context)?.settings.arguments as int? ?? -1;
          return FlashcardPage(deckID: passedDeckID);
        },
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FlutterQuillLocalizations.delegate,
      ],
    );
  }
}
