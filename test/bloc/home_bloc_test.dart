import 'package:bloc_test/bloc_test.dart';
import 'package:example_bloc/bloc/home_bloc.dart';
import 'package:example_bloc/bloc/home_event.dart';
import 'package:example_bloc/bloc/home_state.dart';
import 'package:example_bloc/data/api_service.dart';
import 'package:example_bloc/data/seafood_response.dart';
import 'package:example_bloc/utils/result_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late ApiService apiService;
  late HomeBloc homeBloc;

  group('HomeBloc Test', () {
    setUp(() {
      apiService = MockApiService();
      homeBloc = HomeBloc(apiService: apiService);
    });

    group('GetSeafood', () {
      blocTest<HomeBloc, HomeState>(
        'emits [ResultData.loading and ResultData.empty] when GetSeafood is added',
        build: () {
          when(
                () => apiService.getSeafood(),
          ).thenAnswer((_) async => SeafoodResponse(meals: []));
          return homeBloc;
        },
        act: (HomeBloc bloc) => bloc.add(GetSeafood()),
        expect: () => [
          HomeState(
            seafoodState: ResultData.loading(message: 'Loading'),
          ),
          HomeState(
            seafoodState: ResultData.empty(message: 'Kosong'),
          ),
        ],
      );
    });
  });
}
