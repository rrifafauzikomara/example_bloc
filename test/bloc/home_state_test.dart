import 'package:bloc_test/bloc_test.dart';
import 'package:example_bloc/bloc/home_bloc.dart';
import 'package:example_bloc/bloc/home_state.dart';
import 'package:example_bloc/data/api_service.dart';
import 'package:example_bloc/utils/result_data.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late ApiService apiService;
  late HomeBloc homeBloc;

  setUp(() {
    apiService = MockApiService();
    homeBloc = HomeBloc(apiService: apiService);
  });

  group("HomeState Test", () {
    blocTest(
      'emits [] when nothing is added',
      build: () => homeBloc,
      expect: () => [],
    );

    test('Initial state for seafoodState is ResultData.initial()', () {
      expect(
        homeBloc.state.seafoodState.status,
        HomeState(
          seafoodState: ResultData.initial(),
        ).seafoodState.status,
      );
    });
  });
}
