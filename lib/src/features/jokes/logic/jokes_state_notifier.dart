part of 'jokes_provider.dart';

class JokesNotifier extends StateNotifier<JokesState> {
  final IJokesRepository _jokesRepository;
  JokesNotifier({
    required IJokesRepository jokesRepository,
  })  : _jokesRepository = jokesRepository,
        super(const JokesState.initial());

  Future<void> getJoke() async {
    state = const JokesState.loading();
    try {
      final joke = await _jokesRepository.getJoke();
      state = JokesState.data(joke: joke);
    } catch (_) {
      state = const JokesState.error('Gran error');
    }
  }

  JokeModel? getJ() {
    return _jokesRepository.joke;
  }
}
