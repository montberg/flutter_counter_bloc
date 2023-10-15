import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/counter_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CounterBloc(),
    child: const MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

Color _textColor = Colors.white;
TextStyle _counterStyle = TextStyle(fontSize: 120, color: _textColor);
Color _fabColor = Colors.yellow;
Color _fabIconColor = Colors.black.withOpacity(0.8);
Color _backgroundColor = Colors.teal;

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: _backgroundColor.withOpacity(0.7),
        body: Center(
          child: Card(
            color: _backgroundColor,
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlocBuilder<CounterBloc, CounterBlocState>(
                    builder: (context, state) {
                      return Text(
                        state.counter.toString(),
                        style: _counterStyle,
                      );
                    },
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        backgroundColor: _fabColor,
                        foregroundColor: _fabIconColor,
                        onPressed: () {
                          BlocProvider.of<CounterBloc>(context)
                              .add(IncrementEvent());
                        },
                        child: const Icon(Icons.add),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      FloatingActionButton(
                        backgroundColor: _fabColor,
                        foregroundColor: _fabIconColor,
                        onPressed: () {
                          BlocProvider.of<CounterBloc>(context)
                              .add(DecrementEvent());
                        },
                        child: const Icon(Icons.remove),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
