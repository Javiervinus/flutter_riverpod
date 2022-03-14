import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/src/features/jokes/logic/jokes_provider.dart';

class JokesPage extends ConsumerWidget {
  const JokesPage({Key? key}) : super(key: key);
  static const routeName = 'JokesPage';
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const JokesPage());
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(jokesNotifierProvider);
    var joke = context.read(jokesNotifierProvider.notifier).getJ();

    return Scaffold(
      appBar: AppBar(title: Text(joke?.setup ?? "vacio")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _JokeConsumer(),
            const SizedBox(height: 50),
            _ButtonConsumer(),
            // Text(joke != null ? joke.delivery! : "vacio")
          ],
        ),
      ),
    );
  }
}

class _JokeConsumer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(jokesNotifierProvider);
    return state.when(
      initial: () => const Text(
        'Press the button to start',
        textAlign: TextAlign.center,
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (joke) => Text('${joke.setup}\n${joke.delivery}'),
      error: (error) => Text(error.toString()),
    );
  }
}

class _ButtonConsumer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(jokesNotifierProvider);
    return ElevatedButton(
      child: const Text('Press me to get a joke'),
      onPressed: !state.isLoading
          ? () {
              context.read(jokesNotifierProvider.notifier).getJoke();
            }
          : null,
    );
  }
}
