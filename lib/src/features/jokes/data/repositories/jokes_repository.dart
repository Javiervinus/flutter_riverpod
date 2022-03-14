import 'package:dio/dio.dart';
import 'package:riverpod_tutorial/src/features/jokes/data/models/joke_model.dart';

abstract class IJokesRepository {
  JokeModel? joke;
  Future<JokeModel> getJoke();
}

class JokesRepository implements IJokesRepository {
  final _dioClient = Dio();
  final url = 'https://v2.jokeapi.dev/joke/Programming?type=twopart';
  @override
  Future<JokeModel> getJoke() async {
    try {
      final result = await _dioClient.get(url);
      if (result.statusCode == 200) {
        joke = JokeModel.fromJson(result.data);
        return JokeModel.fromJson(result.data);
      } else {
        throw Exception();
      }
    } catch (_) {
      throw Exception();
    }
  }

  @override
  JokeModel? joke;
}
