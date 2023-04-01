import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vorlesung/blocs/bloc/counter_bloc.dart';
import 'package:flutter_vorlesung/widgets/hit_counter.dart';

void main() {
  runApp(const MyApp());
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
  String? appTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(appTitle ?? "Standard Title"),
      ),
      body: BlocProvider(
        create: (context) => CounterBloc(),
        child: Center(
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HitCounter(counter: state.counter),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  ElevatedButton(
                      onPressed: () => BlocProvider.of<CounterBloc>(context)
                          .add(CounterIncrease()),
                      child: const Text('Increment')),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  ElevatedButton(
                      onPressed: () => BlocProvider.of<CounterBloc>(context)
                          .add(CounterDecrease()),
                      child: const Text('Decrease')),
                  TextField(
                    decoration: const InputDecoration(labelText: "App Title"),
                    onChanged: (value) {
                      setState(() {
                        appTitle = value;
                      });
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
