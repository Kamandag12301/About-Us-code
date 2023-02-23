import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();

    var favorites = <WordPair>[];

    void toggleFavorite() {
      if (favorites.contains(current)) {
        favorites.remove(current);
      } else {
        favorites.add(current);
      }
      notifyListeners();
    }
  }
}

class BasicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

//bug here
    // IconData icon;
    // if (appState.favorites.contains(pair)) {
    //   icon = Icons.favorite;
    // } else {
    //   icon = Icons.favorite_border;
    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 160, 64),
        title: Text('Appbar'),
      ),
      drawer: Drawer(
          child: Container(
        color: Color.fromARGB(255, 255, 160, 64),
        child: Center(child: Text("I'm a Eggman")),
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("../assets/logo.png"),
            SizedBox(
              height: 15,
            ),
            Text(
              'Squak! Welcome to the birdwatchers den!',
              style: GoogleFonts.tinos(fontSize: 15),
            ),
            Text(
              'Enter the aviary and discover all the different species',
              style: GoogleFonts.tinos(fontSize: 15),
            ),
            Text(
              'there is in Angry Birds!',
              style: GoogleFonts.tinos(fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Developers: ',
              style: GoogleFonts.tinos(fontSize: 20),
            ),
            Text(
              'KV Rhett Laurea ',
              style: GoogleFonts.tinos(fontSize: 15),
            ),
            Text(
              'Wil Erwin Quitayen ',
              style: GoogleFonts.tinos(fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            BigEpic(pair: pair),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
//bug here
                // ElevatedButton.icon(
                //   onPressed: () {
                //     appState.toggleFavorite();
                //   },
                //   icon: Icon(icon),
                //   label: Text('Like'),
                // ),
                // SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                    ('button pressed!');
                  },
                  child: Text(
                    'Continue',
                    style: GoogleFonts.tinos(fontSize: 40),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BigEpic extends StatelessWidget {
  const BigEpic({
    super.key,
    required this.pair,
  });

  final WordPair pair;

//THE BUILDING ZONE

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      elevation: (30),
      color: theme.colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asSnakeCase,
          style: style,
          semanticsLabel: pair.asSnakeCase,
        ),
      ),
    );
  }
}
