import 'package:example_bloc/bloc/home_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeEvent Test', () {
    group('GetSeafood', () {
      test('supports value comparison', () {
        expect(GetSeafood(), GetSeafood());
      });
    });
  });
}
