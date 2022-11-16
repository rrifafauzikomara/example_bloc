import 'package:example_bloc/bloc/home_bloc.dart';
import 'package:example_bloc/bloc/home_event.dart';
import 'package:example_bloc/bloc/home_state.dart';
import 'package:example_bloc/utils/result_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _loadSeafood(BuildContext context) {
    context.read<HomeBloc>().add(GetSeafood());
  }

  @override
  void initState() {
    super.initState();
    _loadSeafood(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Demo'),
      ),
      body: Center(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final status = state.seafoodState.status;
            if (status.isLoading) {
              return const CircularProgressIndicator();
            } else if (status.isError) {
              return Text(state.seafoodState.message);
            } else if (status.isEmpty) {
              return Text(state.seafoodState.message);
            } else if (status.isLoaded) {
              final seafoods = state.seafoodState.data?.meals ?? [];
              return ListView.builder(
                itemCount: seafoods.length,
                itemBuilder: (context, index) {
                  final seafood = seafoods[index];
                  return ListTile(
                    leading: Image.network(seafood.strMealThumb),
                    title: Text(seafood.strMeal),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
