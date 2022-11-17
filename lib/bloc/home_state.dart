import 'package:equatable/equatable.dart';
import 'package:example_bloc/data/seafood_response.dart';
import 'package:example_bloc/utils/result_data.dart';

class HomeState extends Equatable {
  final ResultData<SeafoodResponse> seafoodState;

  const HomeState({
    required this.seafoodState,
  });

  HomeState copyWith({
    ResultData<SeafoodResponse>? seafoodState,
  }) {
    return HomeState(
      seafoodState: seafoodState ?? this.seafoodState,
    );
  }

  @override
  List<Object?> get props => [seafoodState];
}