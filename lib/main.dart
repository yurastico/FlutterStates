import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_states/counter_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => CounterModel(),
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
              'You have pushed the button this many times:',
            ),
          Consumer<CounterModel>(builder: (context, value,child) => Text('${value.counter}',
            style: Theme.of(context).textTheme.headlineMedium,))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Provider.of<CounterModel>(context,listen: false).add,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
