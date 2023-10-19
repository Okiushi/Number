import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Number',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Number'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  bool _keyboardDisplay = true;

  void _updateCounter(int value) {
    setState(() {
      _counter = value;
    });
  }

  void _switchKeyboarDisplay() {
    setState(() {
      _keyboardDisplay = !_keyboardDisplay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Chiffre sélectionné:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Visibility(
                visible: _keyboardDisplay,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  children: List.generate(9, (index) {
                    return Center(
                      child: TextButton(
                        onPressed: () {
                          _updateCounter(index + 1);
                        },
                        child: Text(
                          '${index + 1}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    );
                  }),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _switchKeyboarDisplay,
        child: const Icon(Icons.keyboard),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
