import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:healthlife/app/app.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: HealthLifeApp(),
      ),
    );

    // App should start and show loading or onboarding
    await tester.pump();
  });
}
