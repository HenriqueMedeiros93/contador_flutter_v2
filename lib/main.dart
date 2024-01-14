import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 1, 53, 74)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Contador personalizado em Flutter'),
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

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _counter >= 0
            ? Color.fromARGB(255, 225, 227, 255)
            : Color.fromARGB(255, 248, 195, 195),
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: _counter >= 0
              ? const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 251, 251, 251),
                    Color.fromARGB(255, 198, 201, 248),
                    Color.fromARGB(255, 153, 158, 252),
                    Color.fromARGB(255, 83, 130, 250),
                    Color.fromARGB(255, 27, 100, 247)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 249, 248, 248),
                    Color.fromARGB(255, 243, 169, 169),
                    Color.fromARGB(255, 250, 118, 118),
                    Color.fromARGB(255, 251, 81, 81),
                    Color.fromARGB(255, 244, 6, 6)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 58.0, vertical: 58),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 52.0, vertical: 52),
                  child: Center(
                    child: Text(
                      '$_counter',
                      style: TextStyle(
                        fontSize: 48,
                        color: _counter < 0
                            ? Color.fromARGB(255, 246, 2, 2)
                            : Color.fromARGB(255, 0, 99, 238),
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                  ),
                ),
                onPressed: resetCounter,
                child: const Text(
                  "Zerar contador",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: decrementCounter,
                    tooltip: 'decrement',
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    onPressed: incrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
