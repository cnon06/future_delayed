import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Counter: $count", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {

                


                  for (int i = 0; i < 19; i++) {
                    count = i;

                    await Future.delayed(const Duration(seconds: 1), () {
                     // print('count: $i'); // Prints after 1 second.
                    });

                    setState(() {
                      
                    });
                  }
                },
                child: const Text("Press"))
          ],
        ),
      ),
    );
  }
}
