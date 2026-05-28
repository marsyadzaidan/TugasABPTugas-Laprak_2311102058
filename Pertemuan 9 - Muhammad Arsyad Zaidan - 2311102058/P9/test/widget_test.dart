import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:P9/main.dart';

void main() {
  testWidgets('InfoSec Dashboard UI Components Validation Test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SecurityCenterApp());

    expect(find.text('SOC Operational - Arsyad Zaidan'), findsOneWidget);
    expect(find.text('Muhammad Arsyad Zaidan'), findsOneWidget);
    expect(find.text('NIM: 2311102058'), findsOneWidget);

    expect(find.text('Firewall Node'), findsOneWidget);
    expect(find.text('Wazuh FIM'), findsOneWidget);

    expect(find.text('Emergency Threat Isolation'), findsOneWidget);

    expect(find.text('SYSTEM RISK LEVEL: CRITICAL'), findsOneWidget);
    expect(
      find.text('Mitigation scripts standby on local instance'),
      findsOneWidget,
    );
  });
}
