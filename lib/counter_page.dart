import 'package:flutter/material.dart';
import 'package:flutter_bloc_basic/counter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter Page',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 4,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Your value is:'),
            ],
          ),
          const SizedBox(height: 16),
          StreamBuilder<int>(
            stream: counterBloc.streamState,
            initialData: 0,
            builder: (context, snapshot) {
              return Text(
                '${snapshot.data}',
                style: const TextStyle(fontSize: 24),
              );
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  counterBloc.sinkEvent.add(DecrementEvent());
                },
                child: const Text('Decrement'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  counterBloc.sinkEvent.add(IncrementEvent());
                },
                child: const Text('Increment'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
