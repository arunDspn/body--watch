import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:watcha_body/presentation/add_data_modal/add_data_modal.dart';
import 'package:watcha_body/size_config.dart';

void main() {
  testWidgets(
    'AddDataModal Widget Test',
    (WidgetTester tester) async {
      const tableName = 'weight';
      const measurementName = 'weight';
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              SizeConfig().init(context);
              return const AddDataModal(
                type: tableName,
              );
            },
          ),
        ),
      );

      // Create the Finders.
      final titleFinder = find.text('weight');
      // final messageFinder = find.text('M');

      expect(titleFinder, findsOneWidget);
    },
  );
}
