// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:watcha_body/counter/counter.dart';


class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
  group('CounterPage', () {
    testWidgets('renders CounterView', (tester) async {
      await tester.pumpWidget(const CounterPage());
      expect(find.byType(CounterView), findsOneWidget);
    });
  });

  group('CounterView', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = MockCounterCubit();
    });

    testWidgets('renders current count', (tester) async {
      const state = 42;
      when(() => counterCubit.state).thenReturn(state);
      await tester.pumpWidget(
        BlocProvider.value(
          value: counterCubit,
          child: const CounterView(),
        ),
      );
      expect(find.text('$state'), findsOneWidget);
    });

    testWidgets('calls increment when increment button is tapped',
        (tester) async {
      when(() => counterCubit.state).thenReturn(0);
      when(() => counterCubit.increment()).thenReturn(null);
      await tester.pumpWidget(
        BlocProvider.value(
          value: counterCubit,
          child: const CounterView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.add));
      verify(() => counterCubit.increment()).called(1);
    });

    testWidgets('calls decrement when decrement button is tapped',
        (tester) async {
      when(() => counterCubit.state).thenReturn(0);
      when(() => counterCubit.decrement()).thenReturn(null);
      await tester.pumpWidget(
        BlocProvider.value(
          value: counterCubit,
          child: const CounterView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.remove));
      verify(() => counterCubit.decrement()).called(1);
    });
  });
}
