import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basic/sample_flutter_bloc/bloc/bloc/new_counter_bloc.dart';

class ResultWidget extends StatefulWidget {
  const ResultWidget({super.key});

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewCounterBloc, NewCounterState>(
      builder: (context, state) {
        if (state is NewCounterSuccess) {
          return Text(
            state.counter.toString(),
            style: const TextStyle(fontSize: 24),
          );
        }

        //loading
        if (state is NewCounterLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        //failure
        if (state is NewCounterFailure) {
          return Text(
            state.message,
            style: const TextStyle(fontSize: 24),
          );
        }

        return const Text(
          '0',
          style: TextStyle(fontSize: 24),
        );
      },
    );
  }
}
