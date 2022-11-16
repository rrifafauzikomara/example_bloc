import 'package:bloc/bloc.dart';
import 'package:example_bloc/bloc/home_event.dart';
import 'package:example_bloc/bloc/home_state.dart';
import 'package:example_bloc/data/api_service.dart';
import 'package:example_bloc/utils/result_data.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiService apiService;

  HomeBloc({
    required this.apiService,
  }) : super(
          HomeState(
            seafoodState: ResultData.initial(),
          ),
        ) {
    on<GetSeafood>(_getSeafood);
  }

  void _getSeafood(
    GetSeafood event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(
        state.copyWith(seafoodState: ResultData.loading(message: 'Loading')),
      );
      final result = await apiService.getSeafood();
      if (result.meals.isEmpty) {
        emit(state.copyWith(seafoodState: ResultData.empty(message: 'Kosong')));
      } else {
        emit(state.copyWith(seafoodState: ResultData.loaded(data: result)));
      }
    } catch (e) {
      emit(
        state.copyWith(seafoodState: ResultData.error(message: e.toString())),
      );
    }
  }
}
