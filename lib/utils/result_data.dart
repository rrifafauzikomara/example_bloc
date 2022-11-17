import 'package:equatable/equatable.dart';

enum ViewState { initial, loading, error, loaded, empty }

extension ViewStateExtension on ViewState {
  bool get isLoading => this == ViewState.loading;

  bool get isInitial => this == ViewState.initial;

  bool get isError => this == ViewState.error;

  bool get isLoaded => this == ViewState.loaded;

  bool get isEmpty => this == ViewState.empty;
}

class ResultData<T> extends Equatable {
  final ViewState status;
  final T? data;
  final String message;

  const ResultData._({
    required this.status,
    this.data,
    this.message = "",
  });

  factory ResultData.loaded({T? data}) {
    return ResultData._(status: ViewState.loaded, data: data);
  }

  factory ResultData.error({required String message}) {
    return ResultData._(status: ViewState.error, message: message);
  }

  factory ResultData.loading({required String message}) {
    return ResultData._(status: ViewState.loading, message: message);
  }

  factory ResultData.initial() {
    return const ResultData._(status: ViewState.initial);
  }

  factory ResultData.empty({required String message}) {
    return ResultData._(status: ViewState.empty, message: message);
  }

  @override
  List<Object?> get props => [status, data, message];
}
